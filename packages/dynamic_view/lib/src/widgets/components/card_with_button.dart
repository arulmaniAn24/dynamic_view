import 'package:flutter/material.dart';

class CardWithButton extends StatelessWidget {
  final double width;
  final double height;
  final double paddingDx;
  final double paddingDy;
  final double borderRadius;
  final String title;
  final String buttonTitle;
  final String description;
  final double titleFontSize;
  final double descriptionFontSize;
  final String titleColor;
  final String buttonColor;
  final String descriptionColor;
  final String backgroundColor;
  const CardWithButton({
    super.key,
    required this.width,
    required this.height,
    required this.paddingDx,
    required this.paddingDy,
    required this.borderRadius,
    required this.title,
    required this.buttonTitle,
    required this.description,
    required this.titleFontSize,
    required this.descriptionFontSize,
    required this.titleColor,
    required this.buttonColor,
    required this.descriptionColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(int.parse(backgroundColor)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: 2,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: paddingDx, vertical: paddingDy),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: Color(int.parse(titleColor)),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: descriptionFontSize,
                color: Color(int.parse(descriptionColor)),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  backgroundColor: Color(int.parse(buttonColor)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                onPressed: () {
                  // Action when button is pressed
                },
                child: Text(
                  buttonTitle,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
