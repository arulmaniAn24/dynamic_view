import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'dart:async';

class WindowsKeyListener extends StatefulWidget {
  final Widget child;
  const WindowsKeyListener({super.key, required this.child});

  @override
  WindowsKeyListenerState createState() => WindowsKeyListenerState();
}

class WindowsKeyListenerState extends State<WindowsKeyListener> {
  final FocusNode _focusNode = FocusNode();
  final Set<String> _activeKeys = {};
  late Timer _timer;
  Logger logger = Logger();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewBuilderBloc, ViewBuilderState>(
      builder: (context, state) {
        return KeyboardListener(
          focusNode: _focusNode,
          onKeyEvent: (event) => _handleKeyPress(event,
              selectedWidgetModel: state.selectedWidgetModel!),
          child: widget.child,
        );
      },
    );
  }

  void _handleKeyPress(KeyEvent event,
      {required SelectedWidgetModel selectedWidgetModel}) {
    if (event is KeyDownEvent) {
      switch (event.logicalKey.keyLabel) {
        case 'Arrow Up':
        case 'Arrow Right':
        case 'Arrow Down':
        case 'Arrow Left':
          _activeKeys.add(event.logicalKey.keyLabel);
          if (_activeKeys.length == 1) {
            _startKeyTimer(selectedWidgetModel);
          }
          break;
        case 'Delete':
          _handleDeleteKey(selectedWidgetModel);
          break;
        default:
          logger.d('Pressed ${event.logicalKey.keyLabel}');
      }
    } else if (event is KeyUpEvent) {
      _activeKeys.remove(event.logicalKey.keyLabel);
      if (_activeKeys.isEmpty) {
        _stopKeyTimer();
      }
    }
  }

  void _startKeyTimer(SelectedWidgetModel selectedWidgetModel) {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      for (var keyLabel in _activeKeys) {
        switch (keyLabel) {
          case 'Arrow Up':
            _handleArrowUpKey(selectedWidgetModel);
            break;
          case 'Arrow Right':
            _handleArrowRightKey(selectedWidgetModel);
            break;
          case 'Arrow Down':
            _handleArrowDownKey(selectedWidgetModel);
            break;
          case 'Arrow Left':
            _handleArrowLeftKey(selectedWidgetModel);
            break;
        }
      }
    });
  }

  void _stopKeyTimer() {
    if (_timer.isActive) {
      _timer.cancel();
    }
  }

  void _handleArrowUpKey(SelectedWidgetModel selectedWidgetModel) {
    double moveDy = selectedWidgetModel.widgetModel?.properties['dy'] - 5;
    selectedWidgetModel.widgetModel?.properties['dy'] = moveDy;
    context
        .read<ViewBuilderBloc>()
        .add(SelectWidgetModelEvent(widgetModel: selectedWidgetModel));
  }

  void _handleArrowRightKey(SelectedWidgetModel selectedWidgetModel) {
    double moveDx = selectedWidgetModel.widgetModel?.properties['dx'] + 5;
    selectedWidgetModel.widgetModel?.properties['dx'] = moveDx;
    context
        .read<ViewBuilderBloc>()
        .add(SelectWidgetModelEvent(widgetModel: selectedWidgetModel));
  }

  void _handleArrowDownKey(SelectedWidgetModel selectedWidgetModel) {
    double moveDy = selectedWidgetModel.widgetModel!.properties['dy'] + 5;
    selectedWidgetModel.widgetModel?.properties['dy'] = moveDy;
    context
        .read<ViewBuilderBloc>()
        .add(SelectWidgetModelEvent(widgetModel: selectedWidgetModel));
  }

  void _handleArrowLeftKey(SelectedWidgetModel selectedWidgetModel) {
    double moveDx = selectedWidgetModel.widgetModel?.properties['dx'] - 5;
    selectedWidgetModel.widgetModel?.properties['dx'] = moveDx;
    context
        .read<ViewBuilderBloc>()
        .add(SelectWidgetModelEvent(widgetModel: selectedWidgetModel));
  }

  void _handleDeleteKey(SelectedWidgetModel selectedWidgetModel) {
    context.read<ViewBuilderBloc>().add(RemoveWidgetModelFromDroppedListEvent(
        key: selectedWidgetModel.widgetModel?.properties['key']));
  }

  @override
  void dispose() {
    _stopKeyTimer();
    _focusNode.dispose();
    super.dispose();
  }
}
