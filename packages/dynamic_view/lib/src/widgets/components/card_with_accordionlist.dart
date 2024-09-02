import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class CardWithAccordionList extends StatelessWidget {
  final List<Map<String, String>> accordionItems;
  final double titleFontSize;
  final double contentFontSize;
  final double borderRadius;
  final double width;
  final double height;
  final double paddingDx;
  final double paddingDy;

  const CardWithAccordionList({
    super.key,
    required this.accordionItems,
    required this.titleFontSize,
    required this.contentFontSize,
    required this.borderRadius,
    required this.width,
    required this.height,
    required this.paddingDx,
    required this.paddingDy,
  });

  @override
  Widget build(BuildContext context) {
    List<AccordionItem> accordionTypeItems = _generateItems(accordionItems);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(
        horizontal: paddingDx,
        vertical: paddingDy,
      ),
      child: SingleChildScrollView(
        child: Column(
          children:
              accordionTypeItems.map<Widget>((AccordionItem accordionItem) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ExpansionTileCard(
                borderRadius: BorderRadius.circular(borderRadius),
                baseColor: Colors.grey[200],
                expandedColor: Colors.grey[100],
                onExpansionChanged: (bool expanded) {
                  accordionItem.isExpanded.value = expanded;
                },
                trailing: _TrailingIcon(accordionItem: accordionItem),
                title: Text(
                  accordionItem.headerValue,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(height: 1.0, color: Colors.black12),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          accordionItem.expandedValue,
                          style: TextStyle(
                            fontSize: contentFontSize,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _TrailingIcon extends StatelessWidget {
  final AccordionItem accordionItem;

  const _TrailingIcon({required this.accordionItem});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: accordionItem.isExpanded,
      builder: (context, isExpanded, child) {
        return CircleAvatar(
          radius: 15,
          backgroundColor: const Color.fromARGB(255, 6, 66, 114),
          child: Icon(
            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Colors.white,
            size: 25,
          ),
        );
      },
    );
  }
}

List<AccordionItem> _generateItems(List<Map<String, String>> itemData) {
  return itemData.map((data) {
    return AccordionItem(
      headerValue: data['headerValue'] ?? '',
      expandedValue: data['expandedValue'] ?? '',
    );
  }).toList();
}
