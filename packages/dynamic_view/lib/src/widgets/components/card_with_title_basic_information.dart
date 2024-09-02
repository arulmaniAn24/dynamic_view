import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class CardWithTitleBasicinformation extends StatelessWidget {
  final String title;
  final String idNumber;
  final String name;
  final String mobileNumber;
  final double titleFontSize;
  final double textFontSize;
  final double paddingDx;
  final double paddingDy;
  final double width;
  final double height;

  final List<Map<String, String>> accordionItems;

  const CardWithTitleBasicinformation({
    super.key,
    required this.title,
    required this.idNumber,
    required this.name,
    required this.mobileNumber,
    required this.titleFontSize,
    required this.textFontSize,
    required this.paddingDx,
    required this.paddingDy,
    required this.width,
    required this.height,
    required this.accordionItems,
  });

  @override
  Widget build(BuildContext context) {
    List<AccordionItem> accordionTypeItems = _generateItems(accordionItems);

    return Container(
      width: width,
      height: height,
      constraints: const BoxConstraints(maxHeight: 500),
      child: Card(
        color: Colors.blueGrey[50],
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: paddingDy, horizontal: paddingDx),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 16),
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
        Text(
          title,
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            border: Border.all(color: Colors.grey),
          ),
          child: const Icon(
            Icons.person_outline,
            color: Colors.black,
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildDetails() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            idNumber,
            style: TextStyle(
              fontSize: textFontSize,
              color: Colors.black,
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: textFontSize,
              color: Colors.black,
            ),
          ),
          Text(
            mobileNumber,
            style: TextStyle(
              fontSize: textFontSize,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccordionList(
      {required List<AccordionItem> accordionTypeItems}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(accordionItems.length, (index) {
        return Column(
          children: [
            ExpansionTileCard(
              baseColor: Colors.blueGrey[50],
              expandedColor: Colors.blueGrey[50],
              initialPadding: const EdgeInsets.all(0),
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                accordionTypeItems[index].headerValue,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: ValueListenableBuilder<bool>(
                valueListenable: accordionTypeItems[index].isExpanded,
                builder: (context, isExpanded, child) {
                  return CircleAvatar(
                    radius: 16,
                    backgroundColor: const Color.fromARGB(255, 7, 54, 94),
                    child: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 26,
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
                      accordionTypeItems[index].expandedValue,
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
              onExpansionChanged: (bool expanded) {
                accordionTypeItems[index].isExpanded.value = expanded;
              },
            ),
            if (index != accordionItems.length - 1)
              const Divider(
                thickness: 1,
                height: 1,
                color: Colors.grey,
                indent: 0,
                endIndent: 0,
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
