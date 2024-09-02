import 'package:flutter/material.dart';

class CardWithTitleDescriptionPrototype extends StatelessWidget {
  const CardWithTitleDescriptionPrototype({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xFF757575),
    );

    TextStyle valueStyle = const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFF000000),
    );

    TextStyle subtitleStyle = const TextStyle(
      color: Color(0xFFFF0000),
      fontSize: 13,
    );

    return SizedBox(
      width: 300,
      height: 160,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: const Color(0xFFFFFFFF),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total Customer", style: titleStyle),
              const SizedBox(height: 16),
              Text("32,502", style: valueStyle),
              const SizedBox(height: 8),
              Text("2.1% less than last month", style: subtitleStyle),
            ],
          ),
        ),
      ),
    );
  }
}
