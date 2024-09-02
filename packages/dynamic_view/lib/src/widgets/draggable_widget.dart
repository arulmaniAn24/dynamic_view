import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DraggableWidget extends StatelessWidget {
  final WidgetModel data;

  const DraggableWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Draggable<WidgetModel>(
      data: data,
      feedback: _buildFeedback(),
      childWhenDragging: Opacity(
        opacity: 0.2,
        child: _buildChild(),
      ),
      child: _buildChild(),
    );
  }

  Widget _buildChild() {
    switch (data.type) {
      case 'text':
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              Text(
                '${data.properties['label'].toUpperCase()} : ',
                style: TextStyle(
                    color: Color(int.parse(data.properties['labelColor'])),
                    fontWeight: FontWeight.bold,
                    fontSize: data.properties['labelSize']),
              ),
              Text(
                data.properties['value'].toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(int.parse(data.properties['valueColor'])),
                    fontSize: data.properties['valueSize'],
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        );
      case 'button':
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                    Color(int.parse(data.properties['color'])))),
            onPressed: () {
              if (kDebugMode) {
                print(data.properties['form']);
              }
            },
            child: Text(
              data.properties['label'],
              style: TextStyle(
                  color: Color(int.parse(data.properties['labelColor'])),
                  fontSize: data.properties['labelSize']),
            ),
          ),
        );
      case 'cardWithTitleDescription':
        return const CardWithTitleDescriptionPrototype();
      case 'cardWithMenu':
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: CardWithMenuPrototype(),
        );
      case 'cardWithButton':
        return const CardWithButtonPrototype();
      case 'cardWithProgressbarDate':
        return const CardWithProgressbarDatePrototype();
      case 'cardWithProgressbarImage':
        return const CardWithProgressbarImagePrototype();

      case 'choicechipTitleNumber':
        return const ChoicechipWithTitleNumberPrototype();
      case 'cardWithProgressbarTitleDescription':
        return const CardWithProgressbarTitleDescriptionPrototype();
      case 'recentActivity':
        return const RecentActivityPrototype();
      case 'slidingList':
        return const CardSliderPrototype();
      case 'cardWithHighPriorityButton':
        return const CardWithHighPriorityButtonPrototype();
      case 'cardWithTitleDetails':
        return const CardWithTitleDetailsPrototype();
      case 'cardWithProfileAddressDetails':
        return const CardWithProfileAddressDetailsPrototype();
      case 'cardWithProfileDetails':
        return const CardWithProfileDetailsPrototype();
      case 'cardWithTitleBasicinformation':
        return const CardWithTitleBasicinformationPrototype();

      case 'cardWithAccordionList':
        return const CardWithAccordionlistPrototype();

      default:
        return Container();
    }
  }

  Widget _buildFeedback() {
    switch (data.type) {
      case 'text':
        return Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data.properties['label'].toString().toUpperCase(),
              style: TextStyle(
                  fontSize: data.properties['labelSize'],
                  color: Color(int.parse(data.properties['labelColor']))),
            ),
          ),
        );
      case 'button':
        return Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(data.properties['borderRadius'])),
                color: Color(int.parse(data.properties['color']))),
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data.properties['label'],
              style: TextStyle(
                  color: Color(int.parse(data.properties['labelColor'])),
                  fontSize: data.properties['labelSize']),
            ),
          ),
        );
      case 'cardWithTitleDescription':
        return const CardWithTitleDescriptionPrototype();
      case 'cardWithMenu':
        return const CardWithMenuPrototype();
      case 'cardWithButton':
        return const CardWithButtonPrototype();
      case 'cardWithProgressbarDate':
        return const CardWithProgressbarDatePrototype();
      case 'cardWithProgressbarImage':
        return const CardWithProgressbarImagePrototype();
      case 'choicechipTitleNumber':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            borderRadius: BorderRadius.circular(10),
            child: const ChoicechipWithTitleNumberPrototype(),
          ),
        );
      case 'cardWithProgressbarTitleDescription':
        return const CardWithProgressbarTitleDescriptionPrototype();
      case 'recentActivity':
        return const RecentActivityPrototype();
      case 'slidingList':
        return const CardSliderPrototype();
      case 'cardWithHighPriorityButton':
        return const CardWithHighPriorityButtonPrototype();

      case 'cardWithTitleDetails':
        return const CardWithTitleDetailsPrototype();

      case 'cardWithProfileAddressDetails':
        return const CardWithProfileAddressDetailsPrototype();
      case 'cardWithProfileDetails':
        return const CardWithProfileDetailsPrototype();
      case 'cardWithTitleBasicinformation':
        return const SizedBox();

      case 'cardWithAccordionList':
        return const SizedBox();

      default:
        return Container();
    }
  }
}
