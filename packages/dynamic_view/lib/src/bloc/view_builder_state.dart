part of 'view_builder_bloc.dart';

enum ViewBuilderStatus { initial, loading, loaded, error }

final class ViewBuilderState extends Equatable {
  const ViewBuilderState({
    required this.status,
    required this.message,
    required this.droppedWidgetModels,
    required this.selectedWidgetModel,
    required this.height,
    required this.width,
    required this.leftPanelView,
    required this.rightPanelView,
    required this.devices,
    required this.selectedDevice,
    required this.widthController,
    required this.heightController,
  });

  final ViewBuilderStatus status;
  final String message;
  final List<WidgetModel> droppedWidgetModels;
  final SelectedWidgetModel? selectedWidgetModel;
  final double height;
  final double width;
  final bool leftPanelView;
  final bool rightPanelView;
  final List<DeviceOption> devices;
  final DeviceOption? selectedDevice;

  // controllers
  final TextEditingController widthController;
  final TextEditingController heightController;

  static ViewBuilderState initial = ViewBuilderState(
    status: ViewBuilderStatus.initial,
    message: '',
    droppedWidgetModels: const [],
    selectedWidgetModel:
        SelectedWidgetModel(widgetModel: null, selectedKey: ''),
    height: deviceList.map((json) => DeviceOption.fromJson(json)).first.height,
    width: deviceList.map((json) => DeviceOption.fromJson(json)).first.width,
    devices: deviceList.map((json) => DeviceOption.fromJson(json)).toList(),
    leftPanelView: true,
    rightPanelView: true,
    selectedDevice: deviceList.map((json) => DeviceOption.fromJson(json)).first,
    widthController: TextEditingController(
        text: deviceList
            .map((json) => DeviceOption.fromJson(json))
            .first
            .width
            .toString()),
    heightController: TextEditingController(
        text: deviceList
            .map((json) => DeviceOption.fromJson(json))
            .first
            .height
            .toString()),
  );

  ViewBuilderState copyWith({
    ViewBuilderStatus? status,
    String? message,
    List<WidgetModel>? droppedWidgetModels,
    SelectedWidgetModel? selectedWidgetModel,
    double? height,
    double? width,
    bool? leftPanelView,
    bool? rightPanelView,
    List<DeviceOption>? devices,
    DeviceOption? selectedDevice,
    TextEditingController? widthController,
    TextEditingController? heightController,
  }) {
    return ViewBuilderState(
      status: status ?? this.status,
      message: message ?? this.message,
      droppedWidgetModels: droppedWidgetModels ?? this.droppedWidgetModels,
      selectedWidgetModel: selectedWidgetModel ?? this.selectedWidgetModel,
      height: height ?? this.height,
      width: width ?? this.width,
      devices: devices ?? this.devices,
      selectedDevice: selectedDevice ?? this.selectedDevice,
      widthController: widthController ?? this.widthController,
      heightController: heightController ?? this.heightController,
      leftPanelView: leftPanelView ?? this.leftPanelView,
      rightPanelView: rightPanelView ?? this.rightPanelView,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        droppedWidgetModels,
        height,
        width,
        leftPanelView,
        rightPanelView,
        devices,
        selectedDevice,
        widthController,
        heightController
      ];
}

const deviceList = [
  {"name": "phone", "width": 375, "height": 667},
  // {"name": "iPhone XR", "width": 414, "height": 896},
  // {"name": "iPhone 12 Pro", "width": 390, "height": 844},
  // {"name": "iPhone 14 Pro Max", "width": 430, "height": 932},
  // {"name": "Pixel 7", "width": 412, "height": 915},
  // {"name": "Samsung Galaxy S8+", "width": 360, "height": 740},
  // {"name": "Samsung Galaxy S20 Ultra", "width": 412, "height": 915},
  // {"name": "iPad Mini", "width": 768, "height": 1024},
  {"name": "tablet", "width": 820, "height": 1180},
  // {"name": "iPad Pro", "width": 1024, "height": 1366},
  // {"name": "Surface Pro 7", "width": 912, "height": 1368},
  // {"name": "Surface Duo", "width": 540, "height": 720},
  // {"name": "Galaxy Z Fold 5", "width": 816, "height": 1512},
  {"name": "desktop", "width": 1920, "height": 1280},
  // {"name": "Samsung Galaxy A51/71", "width": 412, "height": 915},
  // {"name": "Nest Hub", "width": 1024, "height": 600},
  // {"name": "Nest Hub Max", "width": 1280, "height": 800}
];
