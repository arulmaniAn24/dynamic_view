import 'dart:math';

import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_box_transform/flutter_box_transform.dart';
import 'package:gap/gap.dart';

class DropTarget extends StatefulWidget {
  const DropTarget({super.key});

  @override
  DropTargetState createState() => DropTargetState();
}

class DropTargetState extends State<DropTarget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewBuilderBloc, ViewBuilderState>(
      builder: (context, state) {
        return Container(
          height: double.infinity,
          color: Colors.grey.shade200,
          child: Column(
            children: [
              const Gap(5),
              const CustomToolbar(),
              // const DeviceDropdown(),
              const Gap(5),
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    child: GridPaper(
                      divisions: 1,
                      color: Colors.transparent,
                      child: Container(
                        color: Colors.white54,
                        height: state.height,
                        width: state.width,
                        child: Scaffold(
                          appBar: AppBar(
                            backgroundColor: Colors.blueAccent,
                          ),
                          bottomNavigationBar: BottomNavigationBar(
                            items: const <BottomNavigationBarItem>[
                              BottomNavigationBarItem(
                                icon: Icon(Icons.home),
                                label: 'Home',
                                backgroundColor: Colors.black,
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(Icons.business),
                                label: 'Business',
                                backgroundColor: Colors.green,
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(Icons.school),
                                label: 'School',
                                backgroundColor: Colors.purple,
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(Icons.settings),
                                label: 'Settings',
                                backgroundColor: Colors.pink,
                              ),
                            ],
                            currentIndex: 0,
                            selectedItemColor: Colors.yellow[800],
                            onTap: (value) {},
                          ),
                          body: DragTarget<WidgetModel>(
                            onAcceptWithDetails: (details) {
                              double width = details.data.properties['width'];
                              if (details.data.type ==
                                  widgetModelType(WidgetType.button)) {
                                String label = details.data.properties['label'];
                                width = (label.length * 8) + 30;
                              }
                              if (details.data.type ==
                                  widgetModelType(WidgetType.text)) {
                                String label = details.data.properties['label'];
                                String value = details.data.properties['value'];
                                width = (((label.length * 8) +
                                        (value.length * 8))) +
                                    30;
                              }
                              details.data.properties['width'] = width;
                              details.data.properties['dx'] =
                                  (state.width / 2) -
                                      (details.data.properties['width'] / 2);
                              details.data.properties['dy'] = state.height / 2 -
                                  (details.data.properties['height'] / 2);
                              context.read<ViewBuilderBloc>().add(
                                    DroppedWidgetModelEvent(
                                        widget: details.data),
                                  );
                            },
                            builder: (BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected) {
                              return LayoutBuilder(
                                builder: (context, constraints) {
                                  final double bodyHeight =
                                      constraints.maxHeight;
                                  final double bodyWidth = constraints.maxWidth;
                                  return Expanded(
                                    child: ScrollConfiguration(
                                      behavior: ScrollConfiguration.of(context)
                                          .copyWith(scrollbars: false),
                                      child: SingleChildScrollView(
                                        child: SizedBox(
                                          height: max(
                                              state.droppedWidgetModels
                                                  .fold<double>(
                                                0.0,
                                                (sum, widgetModel) =>
                                                    sum +
                                                    (widgetModel.properties[
                                                            'height'] ??
                                                        0.0) +
                                                    10,
                                              ),
                                              bodyHeight),
                                          width: bodyWidth,
                                          child: Stack(
                                            fit: StackFit.passthrough,
                                            children: state.droppedWidgetModels
                                                .map((widgetModel) {
                                              final double dx = widgetModel
                                                      .properties['dx'] ??
                                                  0.0;
                                              final double dy = widgetModel
                                                      .properties['dy'] ??
                                                  0.0;
                                              final double height = widgetModel
                                                      .properties['height'] ??
                                                  50.0;
                                              double width = widgetModel
                                                  .properties['width'];

                                              Rect rect = Rect.fromLTWH(
                                                  dx, dy, width, height);

                                              return TransformableBox(
                                                handleTapSize: 7,
                                                allowContentFlipping: false,
                                                allowFlippingWhileResizing:
                                                    false,
                                                sideHandleBuilder:
                                                    (context, handle) {
                                                  if (handle
                                                      .influencesHorizontal) {
                                                    return const CircleAvatar(
                                                      backgroundColor:
                                                          Colors.black,
                                                      foregroundColor:
                                                          Colors.black,
                                                    );
                                                  }
                                                  if (handle
                                                      .influencesVertical) {
                                                    return const CircleAvatar(
                                                      backgroundColor:
                                                          Colors.black,
                                                      foregroundColor:
                                                          Colors.black,
                                                    );
                                                  }
                                                  return Container();
                                                },
                                                rect: rect,
                                                clampingRect: Offset.zero &
                                                    Size(
                                                        bodyWidth,
                                                        max(
                                                            state
                                                                .droppedWidgetModels
                                                                .fold<double>(
                                                              0.0,
                                                              (sum, widgetModel) =>
                                                                  sum +
                                                                  (widgetModel.properties[
                                                                          'height'] ??
                                                                      0.0) +
                                                                  10,
                                                            ),
                                                            bodyHeight)),
                                                onChanged: (result, event) {
                                                  rect = result.rect;
                                                  widgetModel.properties['dx'] =
                                                      result.rect.left;
                                                  widgetModel.properties['dy'] =
                                                      result.rect.top;
                                                  widgetModel.properties[
                                                          'height'] =
                                                      result.rect.height
                                                          .round();
                                                  widgetModel
                                                          .properties['width'] =
                                                      result.rect.width.round();
                                                  context
                                                      .read<ViewBuilderBloc>()
                                                      .add(
                                                        SelectWidgetModelEvent(
                                                            widgetModel:
                                                                SelectedWidgetModel(
                                                                    widgetModel:
                                                                        widgetModel,
                                                                    selectedKey:
                                                                        '')),
                                                      );
                                                },
                                                contentBuilder:
                                                    (context, rect, flip) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      context
                                                          .read<
                                                              ViewBuilderBloc>()
                                                          .add(
                                                            SelectWidgetModelEvent(
                                                                widgetModel: SelectedWidgetModel(
                                                                    widgetModel:
                                                                        widgetModel,
                                                                    selectedKey:
                                                                        widgetModel
                                                                            .properties['key'])),
                                                          );
                                                      context
                                                          .read<
                                                              ViewBuilderBloc>()
                                                          .add(
                                                            const RightPanelViewEvent(
                                                                openOrClose:
                                                                    true),
                                                          );
                                                    },
                                                    child: WindowsKeyListener(
                                                      child: ResizableWidget(
                                                        widget: widgetModel,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
