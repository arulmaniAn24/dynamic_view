import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gap/gap.dart';

class CardWithButtonCustomization extends StatefulWidget {
  final WidgetModel? widget;

  const CardWithButtonCustomization({
    required this.widget,
    super.key,
  });

  @override
  State<CardWithButtonCustomization> createState() =>
      _CardWithButtonCustomizationState();
}

class _CardWithButtonCustomizationState
    extends State<CardWithButtonCustomization> {
  late TextEditingController _labelController;
  late TextEditingController _labelFontSizeController;
  late TextEditingController _descriptionFontSizeController;
  late TextEditingController _widthController;
  late TextEditingController _heightController;
  late TextEditingController _paddingDxController;
  late TextEditingController _paddingDyController;
  late TextEditingController _borderRadiusController;

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  @override
  void didUpdateWidget(covariant CardWithButtonCustomization oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.widget != widget.widget) {
      _initControllers();
      _updateControllers();
    }
  }

  void _initControllers() {
    _labelController =
        TextEditingController(text: widget.widget?.properties['title'] ?? '');
    _labelFontSizeController = TextEditingController(
        text: widget.widget?.properties['titleFontSize']?.toString() ?? '16');
    _descriptionFontSizeController = TextEditingController(
        text: widget.widget?.properties['descriptionFontSize']?.toString() ??
            '14');
    _widthController = TextEditingController(
        text: widget.widget?.properties['width']?.toString() ?? '200');
    _heightController = TextEditingController(
        text: widget.widget?.properties['height']?.toString() ?? '50');
    _paddingDxController = TextEditingController(
        text: widget.widget?.properties['paddingDx']?.toString() ?? '0');
    _paddingDyController = TextEditingController(
        text: widget.widget?.properties['paddingDy']?.toString() ?? '0');
    _borderRadiusController = TextEditingController(
        text: widget.widget?.properties['borderRadius']?.toString() ?? '10');
  }

  void _updateControllers() {
    _widthController.text =
        widget.widget?.properties['width']?.toString() ?? '100';
    _heightController.text =
        widget.widget?.properties['height']?.toString() ?? '50';
  }

  @override
  void dispose() {
    _labelController.dispose();
    _labelFontSizeController.dispose();
    _descriptionFontSizeController.dispose();
    _heightController.dispose();
    _widthController.dispose();
    _paddingDxController.dispose();
    _paddingDyController.dispose();
    _borderRadiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewBuilderBloc, ViewBuilderState>(
      builder: (context, state) {
        _updateControllers();
        final WidgetModel selectedWidget =
            state.selectedWidgetModel!.widgetModel!;
        final String keyString = state.selectedWidgetModel!.selectedKey;

        final Map<String, dynamic> properties =
            Map<String, dynamic>.from(selectedWidget.properties);
        Widget buildFieldsForKey(String key) {
          switch (key) {
            case 'cardWithButtontitle':
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(10),
                  CustomValueTextfield(
                    title: 'Title',
                    keyboardType: TextInputType.text,
                    controller: _labelController,
                    onChanged: (value) {
                      properties['title'] = value;
                      context.read<ViewBuilderBloc>().add(
                            ChangePropertiesSelectedWidgetEvent(
                                changedProperties: properties),
                          );
                    },
                  ),
                  const Gap(20),
                  CustomValueTextfield(
                    title: 'Title Font Size',
                    keyboardType: TextInputType.number,
                    controller: _labelFontSizeController,
                    onChanged: (value) {
                      properties['titleFontSize'] =
                          double.tryParse(value) ?? 16.0;
                      context.read<ViewBuilderBloc>().add(
                          ChangePropertiesSelectedWidgetEvent(
                              changedProperties: properties));
                    },
                  ),
                  const Gap(10),
                  const Divider(
                    color: Colors.white,
                  ),
                  CustomColorPicker(
                    title: 'Select Title Color',
                    pickerColor: int.parse(properties['titleColor']),
                    onColorChanged: (Color color) {
                      properties['titleColor'] = "0x${color.toHexString()}";
                      context.read<ViewBuilderBloc>().add(
                          ChangePropertiesSelectedWidgetEvent(
                              changedProperties: properties));
                    },
                  ),
                ],
              );
            case 'cardWithButtondescription':
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomValueTextfield(
                    title: 'Description Font Size',
                    keyboardType: TextInputType.number,
                    controller: _descriptionFontSizeController,
                    onChanged: (value) {
                      properties['descriptionFontSize'] =
                          double.tryParse(value) ?? 14;
                      context.read<ViewBuilderBloc>().add(
                          ChangePropertiesSelectedWidgetEvent(
                              changedProperties: properties));
                    },
                  ),
                  const Gap(10),
                  const Divider(
                    color: Colors.white,
                  ),
                  CustomColorPicker(
                    title: 'Select Description Color',
                    pickerColor: int.parse(properties['descriptionColor']),
                    onColorChanged: (Color color) {
                      properties['descriptionColor'] =
                          "0x${color.toHexString()}";
                      context.read<ViewBuilderBloc>().add(
                          ChangePropertiesSelectedWidgetEvent(
                              changedProperties: properties));
                    },
                  ),
                ],
              );
            case 'cardWithButtonbuttonTitle':
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomColorPicker(
                    title: 'Select Button Color',
                    pickerColor: int.parse(properties['buttonColor']),
                    onColorChanged: (Color color) {
                      properties['buttonColor'] = "0x${color.toHexString()}";
                      context.read<ViewBuilderBloc>().add(
                          ChangePropertiesSelectedWidgetEvent(
                              changedProperties: properties));
                    },
                  ),
                ],
              );
            default:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomHeigthWidthTextfield(
                                controller: _widthController,
                                onChanged: (value) {
                                  properties['width'] =
                                      double.tryParse(value) ?? 200.0;
                                  context.read<ViewBuilderBloc>().add(
                                      ChangePropertiesSelectedWidgetEvent(
                                          changedProperties: properties));
                                },
                                limitDigits: 2,
                                title: "W",
                                width: 40),
                            const Gap(30),
                            CustomHeigthWidthTextfield(
                                controller: _heightController,
                                onChanged: (value) {
                                  if (value.length <= 3) {
                                    properties['height'] =
                                        double.tryParse(value) ?? 50.0;
                                    context.read<ViewBuilderBloc>().add(
                                          ChangePropertiesSelectedWidgetEvent(
                                              changedProperties: properties),
                                        );
                                  }
                                },
                                limitDigits: 2,
                                title: "H",
                                width: 40),
                          ],
                        ),
                        const Gap(10),
                        CustomHeigthWidthTextfield(
                            controller: _borderRadiusController,
                            onChanged: (value) {
                              if (value.length <= 3) {
                                properties['borderRadius'] =
                                    double.tryParse(value) ?? 10.0;
                                context.read<ViewBuilderBloc>().add(
                                      ChangePropertiesSelectedWidgetEvent(
                                          changedProperties: properties),
                                    );
                              }
                            },
                            limitDigits: 2,
                            title: "╭",
                            width: 40),
                        const Gap(10),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Padding',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          CustomPaddingTextfield(
                            title: 'Horizontal',
                            width: 80,
                            controller: _paddingDxController,
                            onChanged: (value) {
                              properties['paddingDx'] =
                                  double.tryParse(value) ?? 12.0;
                              context.read<ViewBuilderBloc>().add(
                                  ChangePropertiesSelectedWidgetEvent(
                                      changedProperties: properties));
                            },
                            icon: Icons.horizontal_distribute_sharp,
                            limitDigits: 2,
                          ),
                          const Gap(30),
                          CustomPaddingTextfield(
                            title: 'Vertical',
                            width: 80,
                            controller: _paddingDyController,
                            onChanged: (value) {
                              properties['paddingDy'] =
                                  double.tryParse(value) ?? 12.0;
                              context.read<ViewBuilderBloc>().add(
                                  ChangePropertiesSelectedWidgetEvent(
                                      changedProperties: properties));
                            },
                            icon: Icons.vertical_distribute_sharp,
                            limitDigits: 2,
                          ),
                        ],
                      ),
                      SliderWithValue(
                        properties: properties,
                      ),
                    ],
                  ),
                  const Gap(10),
                  const Divider(
                    color: Colors.white,
                  ),
                  CustomColorPicker(
                    title: 'Select Background Color',
                    pickerColor: int.parse(properties['backgroundColor']),
                    onColorChanged: (Color color) {
                      properties['backgroundColor'] =
                          "0x${color.toHexString()}";
                      context.read<ViewBuilderBloc>().add(
                          ChangePropertiesSelectedWidgetEvent(
                              changedProperties: properties));
                    },
                  ),
                ],
              );
          }
        }

        return Container(
          color: const Color(0xFF334572),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  context.read<ViewBuilderBloc>().add(
                        RightPanelViewEvent(openOrClose: !state.rightPanelView),
                      );
                },
                child: const Icon(
                  Icons.visibility,
                  color: Colors.white,
                ),
              ),
              const Gap(10),
              buildFieldsForKey(keyString),
            ],
          ),
        );
      },
    );
  }
}
