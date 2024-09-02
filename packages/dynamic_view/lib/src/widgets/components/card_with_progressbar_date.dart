import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardWithProgressbarDate extends StatelessWidget {
  final double width;
  final double height;
  final double paddingDx;
  final double paddingDy;
  final double borderRadius;
  final String title;
  final String value;
  final String buttonTitle;
  final String description;
  final double titleFontSize;
  final double valueFontSize;
  final double descriptionFontSize;
  final String titleColor;
  final String valueColor;
  final String buttonColor;
  final String descriptionColor;
  final String backgroundColor;
  const CardWithProgressbarDate({
    super.key,
    required this.width,
    required this.height,
    required this.paddingDx,
    required this.paddingDy,
    required this.borderRadius,
    required this.title,
    required this.value,
    required this.buttonTitle,
    required this.description,
    required this.titleFontSize,
    required this.valueFontSize,
    required this.descriptionFontSize,
    required this.titleColor,
    required this.valueColor,
    required this.buttonColor,
    required this.descriptionColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewBuilderBloc, ViewBuilderState>(
      builder: (context, state) {
        final selectedWidgetModel = state.selectedWidgetModel;
        final selectedKey = selectedWidgetModel?.selectedKey ?? "";

        bool isSelected(String key) => selectedKey == key;
        return HighlightableWidget(
          highlight: isSelected("cardWithProgressbarDate"),
          child: SizedBox(
            width: width,
            height: height,
            child: Card(
              color: Color(int.parse(backgroundColor)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: paddingDx, vertical: paddingDy),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey[200],
                          child: const Icon(
                            Icons.person_outline,
                            color: Colors.black,
                          ),
                        ),
                        buildHighlightableWidget(
                          context: context,
                          isSelected: isSelected("cardWithProgressbarDatebuttonTitle"),
                          key: 'cardWithProgressbarDatebuttonTitle',
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Color(int.parse(buttonColor)),
                              ),
                            ),
                            child: Text(
                              buttonTitle,
                              style: TextStyle(
                                color: Color(int.parse(buttonColor)),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    buildHighlightableWidget(
                      context: context,
                      isSelected: isSelected("cardWithProgressbarDatetitle"),
                      key: 'cardWithProgressbarDatetitle',
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Color(int.parse(titleColor)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    buildHighlightableWidget(
                      context: context,
                      isSelected: isSelected("cardWithProgressbarDatedescription"),
                      key: 'cardWithProgressbarDatedescription',
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: descriptionFontSize,
                          color: Color(int.parse(descriptionColor)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    buildHighlightableWidget(
                      context: context,
                      isSelected: isSelected("cardWithProgressbarDatevalue"),
                      key: 'cardWithProgressbarDatevalue',
                      child: Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              value: double.parse(value) / 100,
                              backgroundColor: Colors.grey[300],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(int.parse(valueColor))),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '$value%',
                            style: TextStyle(
                              fontSize: valueFontSize,
                              color: Color(int.parse(valueColor)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
