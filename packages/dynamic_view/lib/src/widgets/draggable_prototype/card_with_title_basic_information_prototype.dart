import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class CardWithTitleBasicinformationPrototype extends StatelessWidget {
  const CardWithTitleBasicinformationPrototype({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> accordionItems = [
      {
        "headerValue": "Basic Information",
        "expandedValue":
            'Individuals who deliver services at the doorstep. Individuals responsible for delivering services in an identified area.',
      },
    ];
    List<AccordionItem> accordionTypeItems = _generateItems(accordionItems);

    return Container(
      width: 300,
      height: 180,
      constraints: const BoxConstraints(maxHeight: 500),
      child: Card(
        color: Colors.blueGrey[50],
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 8),
                _buildDetails(),
                const Divider(height: 1, color: Colors.grey),
                _buildAccordionList(accordionTypeItems: accordionTypeItems),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Title",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            border: Border.all(color: Colors.grey),
          ),
          child: const Icon(
            Icons.person_outline,
            color: Colors.black,
            size: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildDetails() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Id Number: ",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 5),
              Text(
                "001",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Name: ",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 5),
              Text(
                "John",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Mobile Number: ",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 5),
              Text(
                "897654xxxx",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAccordionList({
    required List<AccordionItem> accordionTypeItems,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(accordionTypeItems.length, (index) {
        final item = accordionTypeItems[index];
        return Column(
          children: [
            ExpansionTileCard(
              baseColor: Colors.blueGrey[50],
              expandedColor: Colors.blueGrey[50],
              initialPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              title: Text(
                item.headerValue,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: ValueListenableBuilder<bool>(
                valueListenable: item.isExpanded,
                builder: (context, isExpanded, child) {
                  return CircleAvatar(
                    radius: 8,
                    backgroundColor: const Color.fromARGB(255, 7, 54, 94),
                    child: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 12,
                    ),
                  );
                },
              ),
              children: [
                const Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 5),
                    child: Text(
                      item.expandedValue,
                      style: const TextStyle(
                        fontSize: 10.0,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
              onExpansionChanged: (bool expanded) {
                item.isExpanded.value = expanded;
              },
            ),
            if (index != accordionTypeItems.length - 1)
              const Divider(
                thickness: 1,
                height: 1,
                color: Colors.grey,
              ),
          ],
        );
      }),
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
