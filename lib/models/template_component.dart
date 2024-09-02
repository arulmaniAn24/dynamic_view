class TemplateComponent {
  final String type;
  final String id;
  final Map<String, dynamic> properties;

  TemplateComponent({
    required this.type,
    required this.id,
    required this.properties,
  });

  factory TemplateComponent.fromJson(Map<String, dynamic> json) {
    return TemplateComponent(
      type: json['type'],
      id: json['id'],
      properties: json['properties'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'id': id,
      'properties': properties,
    };
  }
}
