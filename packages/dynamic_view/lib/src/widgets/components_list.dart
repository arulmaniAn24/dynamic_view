import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';

class DataListWidget extends StatelessWidget {
  const DataListWidget({super.key, required this.viewData});
  final Map<String, dynamic> viewData;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF98A4C2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomSearchBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _buildViewWidgets(viewData),
                ),
              ),
            ),
          ),
          // ..._buildActionButtonWidgets(viewData['actionButtons']),
        ],
      ),
    );
  }

  List<Widget> _buildViewWidgets(Map<String, dynamic> viewData) {
    List<Widget> viewWidgets = [];

    // viewData.forEach((key, value) {
    //   if (value is Map<String, dynamic> && key != "actionButtons") {
    //     viewWidgets.addAll(_buildNestedWidgets(value));
    //   } else if (key != "actionButtons") {
    //     viewWidgets.add(_buildDraggableWidget(key, value));
    //   }
    // });

    viewWidgets.addAll([
      _buildCardWithTitleDescription(),
      _buildCardWithMenu(),
      _buildCardWithButton(),
      _buildCardWithProgressbarDate(),
      _buildCardWithProgressbarImage(),
      _buildChoiceChipTitleNumber(),
      _buildCardWithProgressbarTitleDescription(),
      _buildRecentCarouselWithTitleSubtitleImage(),
      _buildRecentActivity(),
      _buildSlidingList(),
      _buildCardWithHighPriorityButton(),
      _buildCardWithTitleDetails(),
      _buildCardWithProfileAddressDetails(),
      _buildCardProfileDetails(),
      _buildCardWithTitleBasicinformation(),
      _buildCardWithAccordionList(),
    ]);

    return viewWidgets;
  }

  // List<Widget> _buildNestedWidgets(Map<String, dynamic> nestedData) {
  //   return nestedData.entries.map((entry) {
  //     return NestedWidget(
  //       keyString: entry.key,
  //       value: entry.value,
  //     );
  //   }).toList();
  // }

  // Widget _buildDraggableWidget(String key, dynamic value) {
  //   return DraggableWidget(
  //     data: WidgetModel(
  //       type: widgetModelType(WidgetType.text),
  //       properties: {
  //         'key': key,
  //         'label': key,
  //         'value': value,
  //         'width': 100.0,
  //         'height': 30.0,
  //         'labelSize': 14.0,
  //         'valueSize': 12.0,
  //         'labelColor': "0xFF2196F3",
  //         'valueColor': "0xFF000000",
  //         'dx': 0.0,
  //         'dy': 0.0,
  //         'paddingDx': 8.0,
  //         'paddingDy': 4.0
  //       },
  //     ),
  //   );
  // }

  // List<Widget> _buildActionButtonWidgets(Map<String, dynamic>? actionButtons) {
  //   if (actionButtons == null) return [];

  //   return actionButtons.entries.map((entry) {
  //     String buttonLabel = entry.value['label'];
  //     String form = entry.value['form'];
  //     String key = entry.key;

  //     return DraggableWidget(
  //       data: WidgetModel(
  //         type: widgetModelType(WidgetType.button),
  //         properties: {
  //           'key': key,
  //           'form': form,
  //           'label': buttonLabel,
  //           'labelSize': 14.0,
  //           'color': "0xFF2196F3",
  //           'labelColor': "0xFFE1E1E1",
  //           'width': 100.0,
  //           'height': 50.0,
  //           'borderRadius': 10.0,
  //           'dx': 0.0,
  //           'dy': 0.0,
  //           'paddingDx': 8.0,
  //           'paddingDy': 4.0
  //         },
  //       ),
  //     );
  //   }).toList();
  // }

  Widget _buildCardWithTitleDescription() {
    return DraggableWidget(
      data: WidgetModel(
        type: widgetModelType(WidgetType.cardWithTitleDescription),
        properties: {
          "key": "cardWithTitleDescription",
          "width": 300,
          "height": 160,
          "dx": 0.0,
          "dy": 0.0,
          "paddingDx": 16.0,
          "paddingDy": 14.0,
          "borderRadius": 10,
          "title": "Total Customer",
          "value": "32,502",
          "subtitle": "2.1% less than last month",
          "titleFontSize": 16,
          "valueFontSize": 32,
          "subTitleFontSize": 13,
          "titleColor": "0xFF757575",
          "valueColor": "0xFF000000",
          "subTitleColor": "0xFFFF0000",
          "backgroundColor": "0xFFFFFFFF"
        },
      ),
    );
  }

  Widget _buildCardWithMenu() {
    return DraggableWidget(
      data: WidgetModel(
        type: widgetModelType(WidgetType.cardWithMenu),
        properties: {
          "key": "cardWithMenu",
          "width": 300,
          "height": 200,
          "dx": 0.0,
          "dy": 0.0,
          "paddingDx": 8,
          "paddingDy": 8,
          "borderRadius": 8.0,
          "title": "Task",
          "buttonTitle": 'Inprogress',
          "description":
              'when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived.',
          "titleFontSize": 16.0,
          "descriptionFontSize": 14.0,
          "titleColor": "0xFF000000",
          "buttonColor": "0xFF2196F3",
          "descriptionColor": "0xFF525F7F",
          "backgroundColor": "0xFFE9EBF0"
        },
      ),
    );
  }

  Widget _buildCardWithButton() {
    return DraggableWidget(
      data: WidgetModel(
        type: widgetModelType(WidgetType.cardWithButton),
        properties: {
          "key": "cardWithButton",
          "width": 300,
          "height": 200,
          "dx": 0.0,
          "dy": 0.0,
          "paddingDx": 16,
          "paddingDy": 16,
          "borderRadius": 8.0,
          "title": "Task",
          "buttonTitle": 'Completed',
          "description":
              'when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived.',
          "titleFontSize": 16.0,
          "descriptionFontSize": 14.0,
          "titleColor": "0xFF000000",
          "buttonColor": "0xFF2196F3",
          "descriptionColor": "0xFF525F7F",
          "backgroundColor": "0xFFE9EBF0"
        },
      ),
    );
  }

  Widget _buildCardWithProgressbarDate() {
    return DraggableWidget(
      data: WidgetModel(
        type: widgetModelType(WidgetType.cardWithProgressbarDate),
        properties: {
          "key": "cardWithProgressbarDate",
          "width": 300,
          "height": 200,
          "dx": 0.0,
          "dy": 0.0,
          "paddingDx": 16,
          "paddingDy": 16,
          "borderRadius": 8.0,
          "title": "Task",
          "value": "65",
          "buttonTitle": '6th August',
          "description": 'you have 4 tasks left to do',
          "titleFontSize": 18.0,
          "descriptionFontSize": 14.0,
          "valueFontSize": 14,
          "titleColor": "0xFF000000",
          "buttonColor": "0xFF2196F3",
          "descriptionColor": "0xFF757575",
          "valueColor": "0xFF32325D",
          "backgroundColor": "0xFFE9EBF0"
        },
      ),
    );
  }

  Widget _buildCardWithProgressbarImage() {
    return DraggableWidget(
      data: WidgetModel(
        type: widgetModelType(WidgetType.cardWithProgressbarImage),
        properties: {
          "key": "cardWithProgressbarImage",
          "width": 300,
          "height": 180,
          "dx": 0.0,
          "dy": 0.0,
          "paddingDx": 16,
          "paddingDy": 16,
          "borderRadius": 8.0,
          "title": "My Task",
          "value": "65",
          "subtitle": "4 task left to do",
          "description": 'Completed 6',
          "titleFontSize": 20.0,
          "descriptionFontSize": 18.0,
          "subTitleFontSize": 16.0,
          "valueFontSize": 14.0,
          "titleColor": "0xFF000000",
          "descriptionColor": "0xFFFF0000",
          "subTitleColor": "0xFF757575",
          "valueColor": "0xFF32325D",
          "backgroundColor": "0xFFE9EBF0"
        },
      ),
    );
  }

  Widget _buildChoiceChipTitleNumber() {
    return DraggableWidget(
      data: WidgetModel(
        type: widgetModelType(WidgetType.choicechipTitleNumber),
        properties: {
          "key": "choicechipTitleNumber",
          "width": 150,
          "height": 40,
          "dx": 0.0,
          "dy": 0.0,
          "paddingDx": 0.0,
          "paddingDy": 0.0,
          "borderRadius": 20,
          "title": 'Inprogress (5)',
          "chipColor": "0xFF0000FF"
        },
      ),
    );
  }

  Widget _buildCardWithProgressbarTitleDescription() {
    return DraggableWidget(
      data: WidgetModel(
        type: widgetModelType(WidgetType.cardWithProgressbarTitleDescription),
        properties: {
          "key": "cardWithProgressbarTitleDescription",
          "width": 300,
          "height": 140,
          "dx": 0.0,
          "dy": 0.0,
          "paddingDx": 16,
          "paddingDy": 16,
          "borderRadius": 8.0,
          "title": "Task",
          "value": "85",
          "description": 'you have 4 tasks left to do',
          "titleFontSize": 18.0,
          "descriptionFontSize": 14.0,
          "valueFontSize": 14,
          "titleColor": "0xFF000000",
          "descriptionColor": "0xFF757575",
          "valueColor": "0xFF32325D",
          "backgroundColor": "0xFFE9EBF0"
        },
      ),
    );
  }

  Widget _buildRecentCarouselWithTitleSubtitleImage() {
    return DraggableWidget(
      data: WidgetModel(
        type: widgetModelType(WidgetType.recentCarouselWithTitleSubtitleImage),
        properties: {
          "key": "recentCarouselWithTitleSubtitleImage",
          "width": 300,
          "height": 200,
          "dx": 0.0,
          "dy": 0.0,
          "paddingDx": 16,
          "paddingDy": 16,
          "borderRadius": 8.0,
          "carouselItems": [
            {
              'icon': Icons.work_outline,
              'title': 'My task',
              'description': '4/4 finished'
            },
            {
              'icon': Icons.admin_panel_settings_outlined,
              'title': 'Admin hierarchy',
              'description': '2/2 finished'
            },
          ],
          "titleFontSize": 16.0,
          "descriptionFontSize": 14.0,
          "titleColor": "0xFF000000",
          "descriptionColor": "0xFF808080",
          "backgroundColor": "0xFFEEEEEE"
        },
      ),
    );
  }

  Widget _buildRecentActivity() {
    return DraggableWidget(
        data: WidgetModel(
            type: widgetModelType(WidgetType.recentActivity),
            properties: {
          "key": "recentActivity",
          "title": "Recent Activity",
          "viewHistoryText": "View History",
          "activityText": "Loren created a new task #231",
          "viewHistoryTextColor": "0xFF053863",
          "titleFontSize": 20.0,
          "viewHistoryFontSize": 18.0,
          "activityIconSize": 24.0,
          "activityIconColor": "0xFF9E9E9E",
          "activityTextSize": 18.0,
          "activityTextColor": "0xFF000000",
          "width": 350.0,
          "height": 180.0,
          "borderColor": "0xFF9E9E9E",
          "borderWidth": 2.0,
          "dx": 0.0,
          "dy": 0.0,
          "paddingDx": 16,
          "paddingDy": 16,
          "borderRadius": 22.0,
        }));
  }

  Widget _buildSlidingList() {
    return DraggableWidget(
      data: WidgetModel(
          type: widgetModelType(WidgetType.slidingList),
          properties: {
            "key": "slidingList",
            "textFontSize": 20.0,
            "timeFontSize": 16.0,
            "width": 300,
            "height": 150,
            "dx": 0.0,
            "dy": 0.0,
            "paddingDx": 10.0,
            "paddingDy": 10.0,
            "meetings": [
              {'title': 'Meeting 1', 'time': '09:00 AM - 10:00 AM'},
              {'title': 'Meeting 2', 'time': '10:00 AM - 11:00 AM'},
            ],
          }),
    );
  }

  Widget _buildCardWithHighPriorityButton() {
    return DraggableWidget(
      data: WidgetModel(
          type: widgetModelType(WidgetType.cardWithHighPriorityButton),
          properties: {
            "key": "cardWithHighPriorityButton",
            "title": "Meeting",
            "time": "09.00 AM - 10.00 AM",
            "dx": 0.0,
            "dy": 0.0,
            "width": 350,
            "height": 170,
            "paddingDx": 8.0,
            "paddingDy": 16.0,
            "titleFontSize": 20.0,
            "timeFontSize": 14.0,
            "buttonColor": "0xFF000000",
            "buttonText": "High Priority",
          }),
    );
  }

  Widget _buildCardWithTitleDetails() {
    return DraggableWidget(
      data: WidgetModel(
          type: widgetModelType(WidgetType.cardWithTitleDetails),
          properties: {
            "key": "cardWithTitleDetails",
            "title": "Title",
            "idNumber": "001",
            "name": "John",
            "mobileNumber": "897654xxxx",
            "titleFontSize": 24.0,
            "textFontSize": 14.0,
            "width": 300,
            "height": 200,
            "dx": 0.0,
            "dy": 0.0,
            "paddingDx": 16.0,
            "paddingDy": 16.0,
          }),
    );
  }

  Widget _buildCardWithProfileAddressDetails() {
    return DraggableWidget(
      data: WidgetModel(
          type: widgetModelType(WidgetType.cardWithProfileAddressDetails),
          properties: {
            "key": "cardWithProfileAddressDetails",
            "name": "John",
            "idNumber": "001",
            "mobileNumber": "897654xxxx",
            "emailid": "john123@gmail.com",
            "address": "23 2nd Cross 4th Main road 560xxx",
            "titleFontSize": 22.0,
            "textFontSize": 14.0,
            "width": 300,
            "height": 200,
            "dx": 0.0,
            "dy": 0.0,
            "paddingDx": 16.0,
            "paddingDy": 16.0,
          }),
    );
  }

  Widget _buildCardProfileDetails() {
    return DraggableWidget(
      data: WidgetModel(
          type: widgetModelType(WidgetType.cardWithProfileDetails),
          properties: {
            "key": "cardWithProfileDetails",
            "title": "John",
            "idNumber": "001",
            "mobileNumber": "897654xxxx",
            "emailid": "john123@gmail.com",
            "titleFontSize": 22.0,
            "textFontSize": 14.0,
            "width": 300,
            "height": 200,
            "dx": 0.0,
            "dy": 0.0,
            "paddingDx": 16.0,
            "paddingDy": 16.0,
          }),
    );
  }

  Widget _buildCardWithTitleBasicinformation() {
    final accordionItemData = [
      {
        "headerValue": "Basic Information",
        "expandedValue":
            'Individuals who deliver services at the doorstep. Individuals responsible for delivering services in an identified area.',
      },
      {
        "headerValue": "Eligibility",
        "expandedValue":
            'Economic Status: Below Poverty Line (BPL)\nGender: All\nIncome: Less than ₹1,00,000\nLocation: All\nMarital Status: All\nOccupation: Labour',
      },
    ];

    return DraggableWidget(
      data: WidgetModel(
          type: widgetModelType(WidgetType.cardWithTitleBasicinformation),
          properties: {
            "key": "cardWithTitleBasicinformation",
            "title": "Title",
            "idNumber": "001",
            "name": "John",
            "mobileNumber": "897654xxxx",
            "titleFontSize": 22.0,
            "textFontSize": 14.0,
            "width": 300,
            "height": 300,
            "items": accordionItemData,
            "dx": 0.0,
            "dy": 0.0,
            "paddingDx": 16.0,
            "paddingDy": 16.0,
          }),
    );
  }

  Widget _buildCardWithAccordionList() {
    final accordionItemData = [
      {
        "headerValue": "Front Line Worker (FLW)",
        "expandedValue":
            "Individuals who deliver services at the doorstep. Individuals responsible for delivering services in an identified area.",
      },
      // {
      //   "headerValue": "Command Center Managers",
      //   "expandedValue":
      //       "Individuals managing the Command Center for an identified region with groups of FLWs reporting them.",
      // },
      // {
      //   "headerValue": "Community Leaders",
      //   "expandedValue":
      //       "Local and regional community leaders who are responsible for the welfare of individuals in the community.",
      // },
      // {
      //   "headerValue": "Beneficiary",
      //   "expandedValue":
      //       "Individuals in the identified region or locality, for whom the services are delivered.",
      // },
    ];

    return DraggableWidget(
      data: WidgetModel(
        type: widgetModelType(WidgetType.cardWithAccordionList),
        properties: {
          "key": "cardWithAccordionList",
          "items": accordionItemData,
          "titleFontSize": 16.0,
          "contentFontSize": 12.0,
          "borderRadius": 12.0,
          "width": 300,
          "height": 100,
          "dx": 0.0,
          "dy": 0.0,
          "paddingDx": 12.0,
          "paddingDy": 18.0,
        },
      ),
    );
  }
}
