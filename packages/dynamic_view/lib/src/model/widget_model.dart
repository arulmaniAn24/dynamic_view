enum WidgetType {
  text,
  button,
  cardWithTitleDescription,
  cardWithMenu,
  cardWithButton,
  cardWithProgressbarDate,
  cardWithProgressbarImage,
  cardWithProgressbarTitleDescription,
  choicechipTitleNumber,
  recentCarouselWithTitleSubtitleImage,
  recentActivity,
  slidingList,
  cardWithHighPriorityButton,
  cardWithTitleDetails,
  cardWithProfileAddressDetails,
  cardWithProfileDetails,
  cardWithTitleBasicinformation,
  cardWithAccordionList,

}

class WidgetModel {
  final String type;
  Map<String, dynamic> properties;

  WidgetModel({required this.type, required this.properties});

  WidgetModel copyWith({Map<String, dynamic>? properties}) {
    return WidgetModel(
      type: type,
      properties: properties ?? this.properties,
    );
  }

  factory WidgetModel.fromJson(Map<String, dynamic> json) {
    return WidgetModel(
      type: json['type'] as String,
      properties: Map<String, dynamic>.from(json['properties'] as Map),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'properties': properties,
    };
  }
}

class SelectedWidgetModel {
  final WidgetModel? widgetModel;
  final String selectedKey;
  SelectedWidgetModel({this.widgetModel, required this.selectedKey});
}
