class Component {
  final String type;
  final Map<String, dynamic> properties;

  Component({required this.type, required this.properties});

  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
      type: json['type'],
      properties: json['properties'] as Map<String, dynamic>,
    );
  }
}
