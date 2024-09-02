part of 'view_builder_bloc.dart';

class ViewBuilderEvent extends Equatable {
  const ViewBuilderEvent();

  @override
  List<Object> get props => [];
}

class DeviceOptionEvent extends ViewBuilderEvent {
  final DeviceOption device;
  const DeviceOptionEvent({
    required this.device,
  });
  @override
  List<Object> get props => [device];
}

class DroppedWidgetModelEvent extends ViewBuilderEvent {
  final WidgetModel widget;
  const DroppedWidgetModelEvent({
    required this.widget,
  });
  @override
  List<Object> get props => [widget];
}

class RemoveWidgetModelFromDroppedListEvent extends ViewBuilderEvent {
  final String key;
  const RemoveWidgetModelFromDroppedListEvent({
    required this.key,
  });

  @override
  List<Object> get props => [ key];
}

class SelectWidgetModelEvent extends ViewBuilderEvent {
  final SelectedWidgetModel widgetModel;
  const SelectWidgetModelEvent({
    required this.widgetModel,
  });

  @override
  List<Object> get props => [widgetModel];
}

class ChangePropertiesSelectedWidgetEvent extends ViewBuilderEvent {
  final Map<String, dynamic> changedProperties;
  const ChangePropertiesSelectedWidgetEvent({
    required this.changedProperties,
  });

  @override
  List<Object> get props => [changedProperties];
}

final class GetTemplateData extends ViewBuilderEvent {
  final String template;
  const GetTemplateData({required this.template});
  @override
  List<Object> get props => [template];
}

final class ResetRightSideWidget extends ViewBuilderEvent {
  const ResetRightSideWidget();
  @override
  List<Object> get props => [];
}

final class LeftPanelViewEvent extends ViewBuilderEvent {
  const LeftPanelViewEvent({required this.openOrClose});
  final bool openOrClose;
  @override
  List<Object> get props => [openOrClose];
}

final class RightPanelViewEvent extends ViewBuilderEvent {
  const RightPanelViewEvent({required this.openOrClose});
  final bool openOrClose;
  @override
  List<Object> get props => [openOrClose];
}
