import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DynamicViewBuilder extends StatefulWidget {
  final Map<String, dynamic> viewData;

  const DynamicViewBuilder({super.key, required this.viewData});

  @override
  State<DynamicViewBuilder> createState() => _DynamicViewBuilderState();
}

class _DynamicViewBuilderState extends State<DynamicViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ViewBuilderBloc(templateRepository: TemplateRepository()),
      child: BlocBuilder<ViewBuilderBloc, ViewBuilderState>(
        builder: (context, state) {
          void showPreviewDialog() {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return FullScreenPreviewDialog(state: state);
              },
            );
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF1C336E),
              // leading: GestureDetector(
              //     onTap: () {
              //       context.read<ViewBuilderBloc>().add(
              //             LeftPanelViewEvent(openOrClose: !state.leftPanelView),
              //           );
              //     },
              //     child: const Icon(Icons.menu, color: Colors.white, size: 28)),
              centerTitle: true,
              title: const Padding(
                padding: EdgeInsets.only(left: 50.0),
                child: DeviceSelector(),
              ),
              actions: [
                PreviewButton(onPressed: showPreviewDialog),
                const Gap(20),
                // const Gap(5),
                // TextButton.icon(
                //   onPressed: () {
                //     context.read<ViewBuilderBloc>().add(
                //           const GetTemplateData(template: 'template_one'),
                //         );
                //   },
                //   label: const Text('Load Template'),
                //   icon: const Icon(Icons.upload),
                // ),
                // const Gap(5),
              ],
            ),
            body: Row(
              children: [
                Container(
                  color: const Color(0xFF1C336E),
                  height: double.infinity,
                  width: 60,
                  child: const Column(
                    children: [
                      Gap(50),
                      Icon(
                        Icons.card_membership,
                        color: Colors.white,
                      ),
                      Gap(50),
                      Icon(
                        Icons.graphic_eq,
                        color: Colors.white,
                      ),
                      Gap(50),
                      Icon(
                        Icons.timeline,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                state.leftPanelView
                    ? SizedBox(
                        width: 250,
                        child: DataListWidget(
                          viewData: widget.viewData,
                        ),
                      )
                    : const SizedBox.shrink(),
                Expanded(
                  child: Stack(
                    children: [
                      const DropTarget(),
                      state.rightPanelView
                          ? const SizedBox.shrink()
                          : Positioned(
                              top: 10,
                              right: 10,
                              child: InkWell(
                                onTap: () {
                                  context.read<ViewBuilderBloc>().add(
                                        RightPanelViewEvent(
                                            openOrClose: !state.rightPanelView),
                                      );
                                },
                                child: const Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                state.rightPanelView
                    ? SizedBox(
                        width: 250,
                        child: CustomizationPanel(
                          widget: state.selectedWidgetModel!.widgetModel,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          );
        },
      ),
    );
  }
}
