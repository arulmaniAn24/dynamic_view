import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CustomizationPanel extends StatefulWidget {
  final WidgetModel? widget;

  const CustomizationPanel({this.widget, super.key});

  @override
  CustomizationPanelState createState() => CustomizationPanelState();
}

class CustomizationPanelState extends State<CustomizationPanel> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewBuilderBloc, ViewBuilderState>(
      builder: (context, state) {
        if (state.selectedWidgetModel!.widgetModel == null ||
            state.droppedWidgetModels.isEmpty) {
          return Scaffold(
            backgroundColor: const Color(0xFF334572),
            appBar: AppBar(
              title: const Text(
                'Customization Panel',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    context.read<ViewBuilderBloc>().add(
                          RightPanelViewEvent(
                              openOrClose: !state.rightPanelView),
                        );
                  },
                  child: const Icon(
                    Icons.visibility,
                    color: Colors.white,
                  ),
                ),
                const Gap(10),
              ],
              backgroundColor: const Color(0xFF334572),
            ),
            body: const Center(
                child: Text(
              'Select a widget to customize',
              style: TextStyle(
                color: Colors.white,
              ),
            )),
          );
        }

        final WidgetModel selectedWidget =
            state.selectedWidgetModel!.widgetModel!;

        return Scaffold(
          backgroundColor: const Color(0xFF334572),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.widget!.type == widgetModelType(WidgetType.text))
                    TextCustomization(
                      widget: selectedWidget,
                    ),
                  if (widget.widget!.type == widgetModelType(WidgetType.button))
                    ButtonCustomization(
                      widget: selectedWidget,
                    ),
                  if (widget.widget!.type ==
                      widgetModelType(WidgetType.cardWithTitleDescription))
                    CardWithTitleDescriptionCustomization(
                      widget: selectedWidget,
                    ),
                  if (widget.widget!.type ==
                      widgetModelType(WidgetType.cardWithMenu))
                    CardWithMenuCustomization(
                      widget: selectedWidget,
                    ),
                  if (widget.widget!.type ==
                      widgetModelType(WidgetType.cardWithButton))
                    CardWithButtonCustomization(
                      widget: selectedWidget,
                    ),
                  if (widget.widget!.type ==
                      widgetModelType(WidgetType.cardWithProgressbarDate))
                    CardWithProgressBarDateCustomization(
                      widget: selectedWidget,
                    ),
                  if (widget.widget!.type ==
                      widgetModelType(WidgetType.cardWithProgressbarImage))
                    CardWithProgressBarImageCustomization(
                      widget: selectedWidget,
                    ),
                  if (widget.widget!.type ==
                      widgetModelType(WidgetType.choicechipTitleNumber))
                    ChoicechipTitleNumberCustomization(
                      widget: selectedWidget,
                    ),
                  if (widget.widget!.type ==
                      widgetModelType(
                          WidgetType.cardWithProgressbarTitleDescription))
                    CardWithProgressBarTitleDescriptionCustomization(
                      widget: selectedWidget,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
