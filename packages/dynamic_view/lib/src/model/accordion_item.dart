import 'package:flutter/material.dart';

class AccordionItem {
  AccordionItem({
    required this.expandedValue,
    required this.headerValue,
    bool isExpanded = false,
  }) : isExpanded = ValueNotifier(isExpanded);

  final String expandedValue;
  final String headerValue;
  final ValueNotifier<bool> isExpanded;
}