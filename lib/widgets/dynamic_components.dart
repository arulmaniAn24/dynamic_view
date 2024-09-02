import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import '../models/component.dart';
import '../models/template_model.dart';

Widget buildComponentWidget(Component component) {
  switch (component.type) {
    case 'Container':
      return Container(
        color: Color(int.parse(
            component.properties['color']!.replaceFirst('#', '0xff'))),
        padding: EdgeInsets.fromLTRB(
          component.properties['padding']?['left'] ?? 0,
          component.properties['padding']?['top'] ?? 0,
          component.properties['padding']?['right'] ?? 0,
          component.properties['padding']?['bottom'] ?? 0,
        ),
        margin: EdgeInsets.fromLTRB(
          component.properties['margin']?['left'] ?? 0,
          component.properties['margin']?['top'] ?? 0,
          component.properties['margin']?['right'] ?? 0,
          component.properties['margin']?['bottom'] ?? 0,
        ),
        child: component.properties['child'] != null
            ? buildComponentWidget(
                Component.fromJson(component.properties['child']))
            : null,
      );

    case 'Column':
      return Column(
        children: (component.properties['children'] as List<dynamic>)
            .map((child) => buildComponentWidget(
                Component.fromJson(child as Map<String, dynamic>)))
            .toList(),
      );

    case 'Text':
      return Text(
        component.properties['text']!,
        style: TextStyle(
          fontSize: component.properties['fontSize']?.toDouble(),
          color: Color(int.parse(
              component.properties['color']!.replaceFirst('#', '0xff'))),
          fontWeight: FontWeight
              .values[component.properties['fontWeight'] == 'bold' ? 1 : 0],
        ),
        textAlign: TextAlign
            .values[component.properties['textAlign'] == 'center' ? 1 : 0],
      );

    case 'Button':
      return ElevatedButton(
        onPressed: () {
          // Handle button press
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(int.parse(
              component.properties['color']!.replaceFirst('#', '0xff'))),
          padding: EdgeInsets.fromLTRB(
            component.properties['padding']?['left'] ?? 0,
            component.properties['padding']?['top'] ?? 0,
            component.properties['padding']?['right'] ?? 0,
            component.properties['padding']?['bottom'] ?? 0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                component.properties['borderRadius']?.toDouble() ?? 0),
          ),
          elevation: component.properties['elevation']?.toDouble(),
        ),
        child: Text(
          component.properties['text']!,
          style: TextStyle(
            fontSize: component.properties['fontSize']?.toDouble(),
            color: Color(int.parse(
                component.properties['textColor']!.replaceFirst('#', '0xff'))),
          ),
        ),
      );
    case 'AppBar':
      return AppBar(
        title: Text(
          component.properties['title'] ?? '',
          style: TextStyle(
            fontSize: component.properties['fontSize']?.toDouble(),
            color: Color(int.parse(
                component.properties['color']?.replaceFirst('#', '0xff') ??
                    '0xff000000')),
            fontWeight: FontWeight
                .values[component.properties['fontWeight'] == 'bold' ? 1 : 0],
          ),
        ),
        backgroundColor: Color(int.parse(component.properties['backgroundColor']
                ?.replaceFirst('#', '0xff') ??
            '0xff000000')),
        elevation: component.properties['elevation']?.toDouble(),
        actions: (component.properties['actions'] as List<dynamic>?)
                ?.map((action) => buildComponentWidget(
                    Component.fromJson(action as Map<String, dynamic>)))
                .toList() ??
            [],
      );

    case 'Card':
      return Card(
        color: Color(int.parse(
            component.properties['color']?.replaceFirst('#', '0xff') ??
                '0xff000000')),
        elevation: component.properties['elevation']?.toDouble() ?? 1,
        margin: EdgeInsets.fromLTRB(
          component.properties['margin']?['left']?.toDouble() ?? 0,
          component.properties['margin']?['top']?.toDouble() ?? 0,
          component.properties['margin']?['right']?.toDouble() ?? 0,
          component.properties['margin']?['bottom']?.toDouble() ?? 0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              component.properties['borderRadius']?.toDouble() ?? 4),
        ),
        child: component.properties['child'] != null
            ? buildComponentWidget(Component.fromJson(
                component.properties['child'] as Map<String, dynamic>))
            : null,
      );

    case 'CardWithProgressbarImage':
      print('Building CardWithProgressbarImage');
      return CardWithProgressbarImage(
        width: component.properties['width']?.toDouble() ?? 300,
        height: component.properties['height']?.toDouble() ?? 200,
        paddingDx: component.properties['paddingDx']?.toDouble() ?? 16,
        paddingDy: component.properties['paddingDy']?.toDouble() ?? 12,
        borderRadius: component.properties['borderRadius']?.toDouble() ?? 12,
        title: component.properties['title'] ?? '',
        value: component.properties['value'] ?? '0',
        subtitle: component.properties['subtitle'] ?? '',
        description: component.properties['description'] ?? '',
        titleFontSize: component.properties['titleFontSize']?.toDouble() ?? 18,
        subTitleFontSize:
            component.properties['subTitleFontSize']?.toDouble() ?? 14,
        valueFontSize: component.properties['valueFontSize']?.toDouble() ?? 16,
        descriptionFontSize:
            component.properties['descriptionFontSize']?.toDouble() ?? 12,
        titleColor: component.properties['titleColor'] ?? '#000000',
        valueColor: component.properties['valueColor'] ?? '#000000',
        subTitleColor: component.properties['subTitleColor'] ?? '#000000',
        descriptionColor: component.properties['descriptionColor'] ?? '#000000',
        backgroundColor: component.properties['backgroundColor'] ?? '#FFFFFF',
      );

    // Implement other components like 'Image', 'ListView', 'Card', 'Dialog', etc.

    default:
      return SizedBox.shrink();
  }
}
