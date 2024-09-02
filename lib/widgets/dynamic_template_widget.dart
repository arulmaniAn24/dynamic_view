import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import '../models/component.dart';
import '../models/template_model.dart';
import 'dynamic_components.dart';

class DynamicTemplateWidget extends StatelessWidget {
  final TemplateModel template;

  const DynamicTemplateWidget({
    Key? key,
    required this.template,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(" datatype ::: ${template.components.runtimeType}");
    return Container(
      child: LayoutGrid(
        columnSizes: _buildColumnSizes(),
        rowSizes: _buildRowSizes(),
        children: _buildComponents(template.components),
      ),
    );
  }

  List<TrackSize> _buildColumnSizes() {
    // Example: Define column sizes based on your requirement
    return [auto, 1.fr, 1.fr];
  }

  List<TrackSize> _buildRowSizes() {
    // Example: Define row sizes based on your requirement
    return [auto, auto, auto];
  }

  List<Widget> _buildComponents(List<dynamic> components) {
    List<Widget> widgetList = [];

    for (var component in components) {
      if (component is Component) {
        widgetList.add(buildComponentWidget(component));
      } else {
        print('Invalid component data: $component');
        widgetList.add(SizedBox.shrink());
      }
    }

    return widgetList;
  }
}
