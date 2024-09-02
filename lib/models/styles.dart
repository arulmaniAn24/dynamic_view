class Styles {
  final String primaryColor;
  final String secondaryColor;
  final String accentColor;
  final String backgroundColor;
  final String textColor;

  Styles({
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.backgroundColor,
    required this.textColor,
  });

  factory Styles.fromJson(Map<String, dynamic> json) {
    return Styles(
      primaryColor: json['primaryColor'],
      secondaryColor: json['secondaryColor'],
      accentColor: json['accentColor'],
      backgroundColor: json['backgroundColor'],
      textColor: json['textColor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'primaryColor': primaryColor,
      'secondaryColor': secondaryColor,
      'accentColor': accentColor,
      'backgroundColor': backgroundColor,
      'textColor': textColor,
    };
  }
}
