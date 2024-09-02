import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResizableWidget extends StatefulWidget {
  final WidgetModel widget;

  const ResizableWidget({super.key, required this.widget});

  @override
  ResizableWidgetState createState() => ResizableWidgetState();
}

class ResizableWidgetState extends State<ResizableWidget> {
  @override
  Widget build(BuildContext context) {
    String widgetType = widget.widget.type;

    Widget widgetContent;
    switch (widgetType) {
      case 'text':
        widgetContent = Padding(
          padding: EdgeInsets.symmetric(
              horizontal: widget.widget.properties['paddingDx'],
              vertical: widget.widget.properties['paddingDy']),
          child: Row(
            children: [
              Text(
                '${widget.widget.properties['label'].toUpperCase()} : ',
                style: TextStyle(
                    color: Color(
                        int.parse(widget.widget.properties['labelColor'])
                            .toInt()),
                    fontWeight: FontWeight.bold,
                    fontSize: widget.widget.properties['labelSize']),
              ),
              Text(
                widget.widget.properties['value'].toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(
                        int.parse(widget.widget.properties['valueColor'])
                            .toInt()),
                    fontSize: widget.widget.properties['valueSize'],
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        );
        break;
      case 'button':
        widgetContent = Padding(
          padding: EdgeInsets.symmetric(
              horizontal: widget.widget.properties['paddingDx'],
              vertical: widget.widget.properties['paddingDy']),
          child: Container(
            height: widget.widget.properties['height'],
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(widget.widget.properties['borderRadius'])),
              shape: BoxShape.rectangle,
              color:
                  Color(int.parse(widget.widget.properties['color']).toInt()),
            ),
            child: Center(
              child: Text(
                widget.widget.properties['label'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: widget.widget.properties['labelSize'],
                  color: Color(int.parse(widget.widget.properties['labelColor'])
                      .toInt()),
                ),
              ),
            ),
          ),
        );
        break;
      case 'cardWithTitleDescription':
        widgetContent = CardWithTitleDescription(
          width: widget.widget.properties['width'],
          height: widget.widget.properties['height'],
          paddingDx: widget.widget.properties['paddingDx'],
          paddingDy: widget.widget.properties['paddingDy'],
          title: widget.widget.properties['title'],
          value: widget.widget.properties['value'],
          subtitle: widget.widget.properties['subtitle'],
          titleFontSize: widget.widget.properties['titleFontSize'],
          valueFontSize: widget.widget.properties['valueFontSize'],
          subTitleFontSize: widget.widget.properties['subTitleFontSize'],
          titleColor: widget.widget.properties['titleColor'],
          valueColor: widget.widget.properties['valueColor'],
          subTitleColor: widget.widget.properties['subTitleColor'],
          backgroundColor: widget.widget.properties['backgroundColor'],
          borderRadius: widget.widget.properties['borderRadius'],
        );
        break;
      case 'cardWithMenu':
        widgetContent = CardWithMenu(
          width: widget.widget.properties['width'],
          height: widget.widget.properties['height'],
          paddingDx: widget.widget.properties['paddingDx'],
          paddingDy: widget.widget.properties['paddingDy'],
          title: widget.widget.properties['title'],
          buttonTitle: widget.widget.properties['buttonTitle'],
          buttonColor: widget.widget.properties['buttonColor'],
          description: widget.widget.properties['description'],
          titleFontSize: widget.widget.properties['titleFontSize'],
          descriptionFontSize: widget.widget.properties['descriptionFontSize'],
          titleColor: widget.widget.properties['titleColor'],
          descriptionColor: widget.widget.properties['descriptionColor'],
          backgroundColor: widget.widget.properties['backgroundColor'],
          borderRadius: widget.widget.properties['borderRadius'],
        );
        break;
      case 'cardWithButton':
        widgetContent = CardWithButton(
          width: widget.widget.properties['width'],
          height: widget.widget.properties['height'],
          paddingDx: widget.widget.properties['paddingDx'],
          paddingDy: widget.widget.properties['paddingDy'],
          title: widget.widget.properties['title'],
          buttonTitle: widget.widget.properties['buttonTitle'],
          buttonColor: widget.widget.properties['buttonColor'],
          description: widget.widget.properties['description'],
          titleFontSize: widget.widget.properties['titleFontSize'],
          descriptionFontSize: widget.widget.properties['descriptionFontSize'],
          titleColor: widget.widget.properties['titleColor'],
          descriptionColor: widget.widget.properties['descriptionColor'],
          backgroundColor: widget.widget.properties['backgroundColor'],
          borderRadius: widget.widget.properties['borderRadius'],
        );
        break;
      case 'cardWithProgressbarDate':
        widgetContent = CardWithProgressbarDate(
          width: widget.widget.properties['width'],
          height: widget.widget.properties['height'],
          paddingDx: widget.widget.properties['paddingDx'],
          paddingDy: widget.widget.properties['paddingDy'],
          title: widget.widget.properties['title'],
          buttonTitle: widget.widget.properties['buttonTitle'],
          buttonColor: widget.widget.properties['buttonColor'],
          description: widget.widget.properties['description'],
          titleFontSize: widget.widget.properties['titleFontSize'],
          descriptionFontSize: widget.widget.properties['descriptionFontSize'],
          titleColor: widget.widget.properties['titleColor'],
          descriptionColor: widget.widget.properties['descriptionColor'],
          backgroundColor: widget.widget.properties['backgroundColor'],
          borderRadius: widget.widget.properties['borderRadius'],
          value: widget.widget.properties['value'],
          valueFontSize: widget.widget.properties['valueFontSize'],
          valueColor: widget.widget.properties['valueColor'],
        );
        break;
      case 'cardWithProgressbarImage':
        widgetContent = CardWithProgressbarImage(
          width: widget.widget.properties['width'],
          height: widget.widget.properties['height'],
          paddingDx: widget.widget.properties['paddingDx'],
          paddingDy: widget.widget.properties['paddingDy'],
          title: widget.widget.properties['title'],
          subtitle: widget.widget.properties['subtitle'],
          subTitleColor: widget.widget.properties['subTitleColor'],
          description: widget.widget.properties['description'],
          titleFontSize: widget.widget.properties['titleFontSize'],
          subTitleFontSize: widget.widget.properties['subTitleFontSize'],
          descriptionFontSize: widget.widget.properties['descriptionFontSize'],
          titleColor: widget.widget.properties['titleColor'],
          descriptionColor: widget.widget.properties['descriptionColor'],
          backgroundColor: widget.widget.properties['backgroundColor'],
          borderRadius: widget.widget.properties['borderRadius'],
          value: widget.widget.properties['value'],
          valueFontSize: widget.widget.properties['valueFontSize'],
          valueColor: widget.widget.properties['valueColor'],
        );
        break;
      case 'choicechipTitleNumber':
        widgetContent = ChoicechipWithTitleNumber(
          width: widget.widget.properties['width'],
          height: widget.widget.properties['height'],
          paddingDx: widget.widget.properties['paddingDx'],
          paddingDy: widget.widget.properties['paddingDy'],
          title: widget.widget.properties['title'],
          chipColor: widget.widget.properties['chipColor'],
          borderRadius: widget.widget.properties['borderRadius'],
        );
      case 'cardWithProgressbarTitleDescription':
        widgetContent = CardWithProgressbarTitleDescription(
          width: widget.widget.properties['width'],
          height: widget.widget.properties['height'],
          paddingDx: widget.widget.properties['paddingDx'],
          paddingDy: widget.widget.properties['paddingDy'],
          title: widget.widget.properties['title'],
          description: widget.widget.properties['description'],
          titleFontSize: widget.widget.properties['titleFontSize'],
          descriptionFontSize: widget.widget.properties['descriptionFontSize'],
          titleColor: widget.widget.properties['titleColor'],
          descriptionColor: widget.widget.properties['descriptionColor'],
          backgroundColor: widget.widget.properties['backgroundColor'],
          borderRadius: widget.widget.properties['borderRadius'],
          value: widget.widget.properties['value'],
          valueFontSize: widget.widget.properties['valueFontSize'],
          valueColor: widget.widget.properties['valueColor'],
        );
        break;
      case 'recentActivity':
        widgetContent = RecentActivity(
          title: widget.widget.properties['title'],
          viewHistoryText: widget.widget.properties['viewHistoryText'],
          activityText: widget.widget.properties['activityText'],
          viewHistoryTextColor:
              widget.widget.properties['viewHistoryTextColor'],
          titleFontSize: widget.widget.properties['titleFontSize'],
          viewHistoryFontSize: widget.widget.properties['viewHistoryFontSize'],
          activityIconSize: widget.widget.properties['activityIconSize'],
          activityIconColor: widget.widget.properties['activityIconColor'],
          activityTextSize: widget.widget.properties['activityTextSize'],
          activityTextColor: widget.widget.properties['activityTextColor'],
          width: widget.widget.properties['width'],
          height: widget.widget.properties['height'],
          borderColor: widget.widget.properties['borderColor'],
          borderWidth: widget.widget.properties['borderWidth'],
          paddingDx: widget.widget.properties['paddingDx'],
          paddingDy: widget.widget.properties['paddingDy'],
          borderRadius: widget.widget.properties['borderRadius'],
        );
        break;
      case 'slidingList':
        widgetContent = CardWithSlider(
          width: widget.widget.properties['width'],
          height: widget.widget.properties['height'],
          textFontSize: widget.widget.properties['textFontSize'],
          timeFontSize: widget.widget.properties['timeFontSize'],
          meetings: widget.widget.properties['meetings'],
          paddingDx: widget.widget.properties['paddingDx'],
          paddingDy: widget.widget.properties['paddingDy'],
        );
        break;
      case 'cardWithHighPriorityButton':
        widgetContent = CardWithHighPriorityButton(
          title: widget.widget.properties['title'],
          time: widget.widget.properties['time'],
          width: widget.widget.properties['width'],
          height: widget.widget.properties['height'],
          paddingDx: widget.widget.properties['paddingDx'],
          paddingDy: widget.widget.properties['paddingDy'],
          titleFontSize: widget.widget.properties['titleFontSize'],
          timeFontSize: widget.widget.properties['timeFontSize'],
          buttonColor: widget.widget.properties['buttonColor'],
          buttonText: widget.widget.properties['buttonText'],
        );
        break;
      case 'cardWithTitleDetails':
        widgetContent = CardWithTitleDetails(
          title: widget.widget.properties['title'],
          idNumber: widget.widget.properties['idNumber'],
          name: widget.widget.properties['name'],
          mobileNumber: widget.widget.properties['mobileNumber'],
          paddingDx: widget.widget.properties['paddingDx'],
          paddingDy: widget.widget.properties['paddingDy'],
          titleFontSize: widget.widget.properties['titleFontSize'],
          textFontSize: widget.widget.properties['textFontSize'],
          width: widget.widget.properties['width'],
          height: widget.widget.properties['height'],
        );
        break;
      case 'cardWithProfileAddressDetails':
        widgetContent = CardWithProfileAddressDetails(
          name: widget.widget.properties['name'],
          idNumber: widget.widget.properties['idNumber'],
          mobileNumber: widget.widget.properties['mobileNumber'],
          emailid: widget.widget.properties['emailid'],
          address: widget.widget.properties['address'],
          titleFontSize: widget.widget.properties['titleFontSize'],
          textFontSize: widget.widget.properties['textFontSize'],
          paddingDx: widget.widget.properties['paddingDx'],
          paddingDy: widget.widget.properties['paddingDy'],
          width: widget.widget.properties['width'],
          height: widget.widget.properties['height'],
        );
        break;
      case 'cardWithProfileDetails':
        widgetContent = CardWithProfileDetails(
          title: widget.widget.properties['title'],
          idNumber: widget.widget.properties['idNumber'],
          mobileNumber: widget.widget.properties['mobileNumber'],
          emailid: widget.widget.properties['emailid'],
          titleFontSize: widget.widget.properties['titleFontSize'],
          textFontSize: widget.widget.properties['textFontSize'],
          paddingDx: widget.widget.properties['paddingDx'],
          paddingDy: widget.widget.properties['paddingDy'],
          width: widget.widget.properties['width'],
          height: widget.widget.properties['height'],
        );
        break;
      case 'cardWithTitleBasicinformation':
        widgetContent = CardWithTitleBasicinformation(
          title: widget.widget.properties['title'],
          idNumber: widget.widget.properties['idNumber'],
          name: widget.widget.properties['name'],
          mobileNumber: widget.widget.properties['mobileNumber'],
          paddingDx: widget.widget.properties['paddingDx'],
          paddingDy: widget.widget.properties['paddingDy'],
          titleFontSize: widget.widget.properties['titleFontSize'],
          textFontSize: widget.widget.properties['textFontSize'],
          width: widget.widget.properties['width'],
          height: widget.widget.properties['height'],
          accordionItems: widget.widget.properties['items'],
        );
        break;
      case 'cardWithAccordionList':
        widgetContent = CardWithAccordionList(
          paddingDx: widget.widget.properties['paddingDx'],
          paddingDy: widget.widget.properties['paddingDy'],
          titleFontSize: widget.widget.properties['titleFontSize'],
          borderRadius: widget.widget.properties['borderRadius'],
          contentFontSize: widget.widget.properties['contentFontSize'],
          width: widget.widget.properties['width'],
          height: widget.widget.properties['height'],
          accordionItems: widget.widget.properties['items'],
        );
        break;
      default:
        widgetContent = const SizedBox.shrink();
    }

    return buildWithRemove(
        context, widget.widget.properties['key'], widgetContent);
  }

  Widget buildWithRemove(BuildContext context, String key, Widget widget) {
    return Stack(
      children: [
        widget,
        Positioned(
          right: 0,
          top: 0,
          child: InkWell(
            onTap: () {
              context.read<ViewBuilderBloc>().add(
                    RemoveWidgetModelFromDroppedListEvent(key: key),
                  );
            },
            child: const Icon(
              Icons.cancel,
              size: 14,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
