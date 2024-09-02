import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gap/gap.dart';

class ChoicechipTitleNumberCustomization extends StatefulWidget {
  final WidgetModel? widget;
  const ChoicechipTitleNumberCustomization({
    super.key,
    required this.widget,
  });

  @override
  State<ChoicechipTitleNumberCustomization> createState() =>
      _ChoicechipTitleNumberCustomizationState();
}

class _ChoicechipTitleNumberCustomizationState
    extends State<ChoicechipTitleNumberCustomization> {
  late TextEditingController _heightController;
  late TextEditingController _widthController;
  late TextEditingController _borderRadiusController;
  late TextEditingController _paddingDxController;
  late TextEditingController _paddingDyController;

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  @override
  void didUpdateWidget(covariant ChoicechipTitleNumberCustomization oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.widget != widget.widget) {
      _initControllers();
      _updateControllers();
    }
  }

  void _initControllers() {
    _widthController = TextEditingController(
        text: widget.widget?.properties['width']?.toString() ?? '150');
    _heightController = TextEditingController(
        text: widget.widget?.properties['height']?.toString() ?? '40');
    _borderRadiusController = TextEditingController(
        text: widget.widget?.properties['borderRadius']?.toString() ?? '20');
    _paddingDxController = TextEditingController(
        text: widget.widget?.properties['paddingDx']?.toString() ?? '0');
    _paddingDyController = TextEditingController(
        text: widget.widget?.properties['paddingDy']?.toString() ?? '0');
  }

  void _updateControllers() {
    _widthController.text =
        widget.widget?.properties['width']?.toString() ?? '100';
    _heightController.text =
        widget.widget?.properties['height']?.toString() ?? '50';
  }

  @override
  void dispose() {
    _heightController.dispose();
    _widthController.dispose();
    _borderRadiusController.dispose();
    _paddingDxController.dispose();
    _paddingDyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewBuilderBloc, ViewBuilderState>(
      builder: (context, state) {
        _updateControllers();
        final WidgetModel selectedWidget =
            state.selectedWidgetModel!.widgetModel!;
        final Map<String, dynamic> properties =
            Map<String, dynamic>.from(selectedWidget.properties);

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
              Column(
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
                ],
              ),
              const Gap(10),
              const Divider(
                color: Colors.white,
              ),
              const Gap(10),
              CustomColorPicker(
                title: 'Select Chip Color',
                pickerColor: int.parse(properties['chipColor']),
                onColorChanged: (Color color) {
                  properties['chipColor'] = "0x${color.toHexString()}";
                  context.read<ViewBuilderBloc>().add(
                      ChangePropertiesSelectedWidgetEvent(
                          changedProperties: properties));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
