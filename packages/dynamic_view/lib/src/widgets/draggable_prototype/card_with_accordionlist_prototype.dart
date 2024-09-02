import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class CardWithAccordionlistPrototype extends StatelessWidget {
  const CardWithAccordionlistPrototype({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> accordionItems = [
      {
        "headerValue": "Front Line Worker (FLW)",
        "expandedValue":
            "Individuals who deliver services at the doorstep. Individuals responsible for delivering services in an identified area.",
      }
    ];
    ;

    List<AccordionItem> accordionTypeItems = _generateItems(accordionItems);
    return Container(
      width: 250,
      height: 100,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: SingleChildScrollView(
        child: Column(
          children:
              accordionTypeItems.map<Widget>((AccordionItem accordionItem) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ExpansionTileCard(
                borderRadius: BorderRadius.circular(12),
                baseColor: Colors.grey[200],
                expandedColor: Colors.grey[100],
                onExpansionChanged: (bool expanded) {
                  accordionItem.isExpanded.value = expanded;
                },
                trailing: _TrailingIcon(accordionItem: accordionItem),
                title: Text(
                  accordionItem.headerValue,
                  style: const TextStyle(
                    fontSize: 12,
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
                          style: const TextStyle(
                            fontSize: 10,
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
          radius: 8,
          backgroundColor: const Color.fromARGB(255, 6, 66, 114),
          child: Icon(
            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Colors.white,
            size: 15,
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
