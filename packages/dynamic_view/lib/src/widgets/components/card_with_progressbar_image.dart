import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardWithProgressbarImage extends StatelessWidget {
  final double width;
  final double height;
  final double paddingDx;
  final double paddingDy;
  final double borderRadius;
  final String title;
  final String value;
  final String subtitle;
  final String description;
  final double titleFontSize;
  final double subTitleFontSize;
  final double valueFontSize;
  final double descriptionFontSize;
  final String titleColor;
  final String valueColor;
  final String subTitleColor;
  final String descriptionColor;
  final String backgroundColor;
  const CardWithProgressbarImage({
    super.key,
    required this.width,
    required this.height,
    required this.paddingDx,
    required this.paddingDy,
    required this.borderRadius,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.description,
    required this.titleFontSize,
    required this.subTitleFontSize,
    required this.valueFontSize,
    required this.descriptionFontSize,
    required this.titleColor,
    required this.valueColor,
    required this.subTitleColor,
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
          highlight: isSelected('cardWithProgressbarImage'),
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
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildHighlightableWidget(
                                context: context,
                                isSelected:
                                    isSelected("cardWithProgressbarImagetitle"),
                                key: 'cardWithProgressbarImagetitle',
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
                                isSelected: isSelected(
                                    "cardWithProgressbarImagedescription"),
                                key: 'cardWithProgressbarImagedescription',
                                child: Text(
                                  description,
                                  style: TextStyle(
                                    fontSize: descriptionFontSize,
                                    color: Color(int.parse(descriptionColor)),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              buildHighlightableWidget(
                                context: context,
                                isSelected: isSelected(
                                    "cardWithProgressbarImagesubtitle"),
                                key: 'cardWithProgressbarImagesubtitle',
                                child: Text(
                                  subtitle,
                                  style: TextStyle(
                                    fontSize: subTitleFontSize,
                                    color: Color(int.parse(subTitleColor)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey[200],
                          child: const Icon(
                            Icons.person_outline,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    buildHighlightableWidget(
                      context: context,
                      isSelected: isSelected("cardWithProgressbarImagevalue"),
                      key: 'cardWithProgressbarImagevalue',
                      child: Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              value: double.parse(value) / 100,
                              backgroundColor: Colors.grey[300],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
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
