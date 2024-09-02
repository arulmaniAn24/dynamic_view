import 'component.dart';

class TemplateModel {
  final String templateName;
  final String viewKey;
  final String dataId;
  final List<Component> components;
  final Map<String, String> styles;

  TemplateModel({
    required this.templateName,
    required this.viewKey,
    required this.dataId,
    required this.components,
    required this.styles,
  });

  factory TemplateModel.fromJson(Map<String, dynamic> json) {
    var componentList = json['components'] as List;
    List<Component> components = componentList
        .map((i) => Component.fromJson(i as Map<String, dynamic>))
        .toList();

    return TemplateModel(
      templateName: json['templateName'],
      viewKey: json['viewKey'],
      dataId: json['dataId'],
      components: components,
      styles: Map<String, String>.from(json['styles']),
    );
  }
}
