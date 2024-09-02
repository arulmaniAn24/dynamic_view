import 'package:dynamic_view/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChoicechipWithTitleNumber extends StatefulWidget {
  final double width;
  final double height;
  final double paddingDx;
  final double paddingDy;
  final double borderRadius;
  final String title;
  final String chipColor;
  const ChoicechipWithTitleNumber({
    super.key,
    required this.width,
    required this.height,
    required this.paddingDx,
    required this.paddingDy,
    required this.borderRadius,
    required this.title,
    required this.chipColor,
  });

  @override
  ChoicechipWithTitleNumberState createState() =>
      ChoicechipWithTitleNumberState();
}

class ChoicechipWithTitleNumberState extends State<ChoicechipWithTitleNumber> {
  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewBuilderBloc, ViewBuilderState>(
      builder: (context, state) {
        final selectedWidgetModel = state.selectedWidgetModel;
        final selectedKey = selectedWidgetModel?.selectedKey ?? "";
        bool isSelected(String key) => selectedKey == key;
        return HighlightableWidget(
          highlight: isSelected('choicechipTitleNumber'),
          child: SizedBox(
            height: widget.height,
            width: widget.width,
            child: ChoiceChip(
              padding: EdgeInsets.symmetric(
                  horizontal: widget.paddingDx, vertical: widget.paddingDy),
              label: Text(
                widget.title,
                style: TextStyle(
                  color: isSelect
                      ? Colors.white
                      : Color(int.parse(widget.chipColor)),
                ),
              ),
              selected: isSelect,
              onSelected: (bool selected) {
                setState(() {
                  isSelect = selected;
                });
              },
              checkmarkColor: Colors.white,
              backgroundColor: Colors.white,
              selectedColor: Color(int.parse(widget.chipColor)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                side: BorderSide(
                  color: Color(int.parse(widget.chipColor)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
