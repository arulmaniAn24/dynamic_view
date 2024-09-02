import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CardWithProgressbarTitleDescription extends StatelessWidget {
  final double width;
  final double height;
  final double paddingDx;
  final double paddingDy;
  final double borderRadius;
  final String title;
  final String value;
  final String description;
  final double titleFontSize;
  final double valueFontSize;
  final double descriptionFontSize;
  final String titleColor;
  final String valueColor;
  final String descriptionColor;
  final String backgroundColor;
  const CardWithProgressbarTitleDescription({
    super.key,
    required this.width,
    required this.height,
    required this.paddingDx,
    required this.paddingDy,
    required this.borderRadius,
    required this.title,
    required this.value,
    required this.description,
    required this.titleFontSize,
    required this.valueFontSize,
    required this.descriptionFontSize,
    required this.titleColor,
    required this.valueColor,
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
        return LayoutBuilder(builder: (context, constraints) {
          return HighlightableWidget(
            highlight: isSelected('cardWithProgressbarTitleDescription'),
            child: SizedBox(
              width: width,
              height: height,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                color: Color(int.parse(backgroundColor)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: paddingDy, horizontal: paddingDx),
                  child: Row(
                    children: [
                      buildHighlightableWidget(
                        context: context,
                        isSelected: isSelected(
                            "cardWithProgressbarTitleDescriptionvalue"),
                        key: 'cardWithProgressbarTitleDescriptionvalue',
                        child: CircularPercentIndicator(
                          radius: 40.0,
                          lineWidth: 8.0,
                          percent: double.parse(value) / 100,
                          center: Text(
                            "$value%",
                            style: TextStyle(
                              // color: Color(int.parse(valueColor)),
                              fontSize: valueFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          progressColor: Color(int.parse(valueColor)),
                          backgroundColor: Colors.grey[200]!,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildHighlightableWidget(
                            context: context,
                            isSelected: isSelected(
                                "cardWithProgressbarTitleDescriptiontitle"),
                            key: 'cardWithProgressbarTitleDescriptiontitle',
                            child: Text(
                              title,
                              style: TextStyle(
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          buildHighlightableWidget(
                            context: context,
                            isSelected: isSelected(
                                "cardWithProgressbarTitleDescriptiondescription"),
                            key:
                                'cardWithProgressbarTitleDescriptiondescription',
                            child: SizedBox(
                              width: constraints.maxWidth - 140,
                              child: Text(
                                description,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontSize: descriptionFontSize,
                                  color: Color(int.parse(descriptionColor)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
