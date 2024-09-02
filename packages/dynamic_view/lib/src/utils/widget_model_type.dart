import 'package:dynamic_view/dynamic_view_package.dart';

String widgetModelType(WidgetType value) {
  String message = 'text';

  switch (value) {
    case WidgetType.text:
      message = 'text';
      break;
    case WidgetType.button:
      message = 'button';
      break;
    case WidgetType.cardWithTitleDescription:
      message = 'cardWithTitleDescription';
      break;
    case WidgetType.cardWithMenu:
      message = 'cardWithMenu';
      break;
    case WidgetType.cardWithButton:
      message = 'cardWithButton';
      break;
    case WidgetType.cardWithProgressbarDate:
      message = 'cardWithProgressbarDate';
      break;
    case WidgetType.cardWithProgressbarImage:
      message = 'cardWithProgressbarImage';
      break;
    case WidgetType.choicechipTitleNumber:
      message = 'choicechipTitleNumber';
      break;
    case WidgetType.cardWithProgressbarTitleDescription:
      message = 'cardWithProgressbarTitleDescription';
      break;
    case WidgetType.recentCarouselWithTitleSubtitleImage:
      message = 'recentCarouselWithTitleSubtitleImage';
      break;
    case WidgetType.recentActivity:
      message = 'recentActivity';
      break;
    case WidgetType.slidingList:
      message = 'slidingList';
      break;
    case WidgetType.cardWithHighPriorityButton:
      message = 'cardWithHighPriorityButton';
      break;
    case WidgetType.cardWithTitleDetails:
      message = 'cardWithTitleDetails';
      break;
    case WidgetType.cardWithProfileAddressDetails:
      message = 'cardWithProfileAddressDetails';
      break;
    case WidgetType.cardWithProfileDetails:
      message = 'cardWithProfileDetails';
      break;
    case WidgetType.cardWithTitleBasicinformation:
      message = 'cardWithTitleBasicinformation';
      break;
    case WidgetType.cardWithAccordionList:
      message = 'cardWithAccordionList';
      break;
  }
  return message;
}
