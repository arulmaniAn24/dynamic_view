import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardWithMenu extends StatelessWidget {
  final double width;
  final double height;
  final double paddingDx;
  final double paddingDy;
  final double borderRadius;
  final String title;
  final String buttonTitle;
  final String description;
  final double titleFontSize;
  final double descriptionFontSize;
  final String titleColor;
  final String buttonColor;
  final String descriptionColor;
  final String backgroundColor;
  const CardWithMenu({
    super.key,
    required this.width,
    required this.height,
    required this.paddingDx,
    required this.paddingDy,
    required this.borderRadius,
    required this.title,
    required this.buttonTitle,
    required this.description,
    required this.titleFontSize,
    required this.descriptionFontSize,
    required this.titleColor,
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
          highlight: isSelected('cardWithMenu'),
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
                      children: [
                        buildHighlightableWidget(
                          child: Text(
                            title,
                            style: TextStyle(
                              color: Color(int.parse(titleColor)),
                              fontWeight: FontWeight.bold,
                              fontSize: titleFontSize,
                            ),
                          ),
                          context: context,
                          key: 'cardWithMenutitle',
                          isSelected: isSelected('cardWithMenutitle'),
                        ),
                        const Spacer(),
                        const Icon(Icons.more_vert),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    buildHighlightableWidget(
                        context: context,
                        key: "cardWithMenudescription",
                        child: Text(
                          description,
                          style: TextStyle(
                            color: Color(int.parse(descriptionColor)),
                            fontSize: descriptionFontSize,
                          ),
                        ),
                        isSelected: isSelected("cardWithMenudescription")),
                    const SizedBox(height: 16.0),
                    buildHighlightableWidget(
                        context: context,
                        key: "cardWithMenubuttonTitle",
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 6.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: Color(int.parse(buttonColor)),
                            ),
                          ),
                          child: Text(
                            buttonTitle,
                            style: TextStyle(
                              color: Color(int.parse(buttonColor)),
                            ),
                          ),
                        ),
                        isSelected: isSelected("cardWithMenubuttonTitle")),
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
