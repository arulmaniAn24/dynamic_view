import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardWithTitleDescription extends StatelessWidget {
  final double width;
  final double height;
  final double paddingDx;
  final double paddingDy;
  final double borderRadius;
  final String title;
  final String value;
  final String subtitle;
  final double titleFontSize;
  final double valueFontSize;
  final double subTitleFontSize;
  final String titleColor;
  final String valueColor;
  final String subTitleColor;
  final String backgroundColor;

  const CardWithTitleDescription({
    super.key,
    required this.width,
    required this.height,
    required this.paddingDx,
    required this.paddingDy,
    required this.borderRadius,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.titleFontSize,
    required this.valueFontSize,
    required this.subTitleFontSize,
    required this.titleColor,
    required this.valueColor,
    required this.subTitleColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewBuilderBloc, ViewBuilderState>(
      builder: (context, state) {
        final selectedWidgetModel = state.selectedWidgetModel;
        final selectedKey = selectedWidgetModel?.selectedKey ?? "";

        bool isSelected(String key) => selectedKey == key;

        TextStyle titleStyle = TextStyle(
          fontSize: titleFontSize,
          fontWeight: FontWeight.w500,
          color: Color(int.parse(titleColor)),
        );

        TextStyle valueStyle = TextStyle(
          fontSize: valueFontSize,
          fontWeight: FontWeight.bold,
          color: Color(int.parse(valueColor)),
        );

        TextStyle subtitleStyle = TextStyle(
          color: Color(int.parse(subTitleColor)),
          fontSize: subTitleFontSize,
        );

        return HighlightableWidget(
          highlight: isSelected('cardWithTitleDescription'),
          child: SizedBox(
            width: width,
            height: height,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              color: Color(int.parse(backgroundColor)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: paddingDx,
                  vertical: paddingDy,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHighlightableText(
                      context,
                      'cardWithTitleDescriptiontitle',
                      title,
                      titleStyle,
                      isSelected('cardWithTitleDescriptiontitle'),
                    ),
                    const SizedBox(height: 16),
                    _buildHighlightableText(
                      context,
                      'cardWithTitleDescriptionvalue',
                      value,
                      valueStyle,
                      isSelected('cardWithTitleDescriptionvalue'),
                    ),
                    const SizedBox(height: 8),
                    _buildHighlightableText(
                      context,
                      'cardWithTitleDescriptionsubTitle',
                      subtitle,
                      subtitleStyle,
                      isSelected('cardWithTitleDescriptionsubTitle'),
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

  Widget _buildHighlightableText(
    BuildContext context,
    String key,
    String text,
    TextStyle style,
    bool isSelected,
  ) {
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
        child: Text(text, style: style),
      ),
    );
  }
}
