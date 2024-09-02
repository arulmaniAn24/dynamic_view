import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HighlightableWidget extends StatefulWidget {
  final Widget child;
  final bool highlight;
  const HighlightableWidget(
      {super.key, required this.child, required this.highlight});

  @override
  HighlightableWidgetState createState() => HighlightableWidgetState();
}

class HighlightableWidgetState extends State<HighlightableWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.highlight ? Colors.blue : Colors.transparent,
          width: 1.0,
        ),
      ),
      child: widget.child,
    );
  }
}

Widget buildHighlightableWidget({
  required BuildContext context,
  required String key,
  required Widget child,
  required bool isSelected,
}) {
  return HighlightableWidget(
    highlight: isSelected,
    child: InkWell(
      onTap: () {
        context.read<ViewBuilderBloc>().add(
              SelectWidgetModelEvent(
                widgetModel: SelectedWidgetModel(
                  widgetModel: context
                      .read<ViewBuilderBloc>()
                      .state
                      .selectedWidgetModel!
                      .widgetModel,
                  selectedKey: key,
                ),
              ),
            );
      },
      child: child,
    ),
  );
}
