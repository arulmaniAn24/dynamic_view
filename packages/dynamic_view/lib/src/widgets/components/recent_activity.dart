import 'package:flutter/material.dart';

class RecentActivity extends StatelessWidget {
  final String title;
  final String viewHistoryText;
  final String activityText;
  final String viewHistoryTextColor;
  final double titleFontSize;
  final double viewHistoryFontSize;
  final double activityIconSize;
  final String activityIconColor;
  final double activityTextSize;
  final String activityTextColor;
  final double width;
  final double height;
  final String borderColor;
  final double borderWidth;
  final double paddingDx;
  final double paddingDy;
  final double borderRadius;

  const RecentActivity({
    super.key,
    required this.title,
    required this.viewHistoryText,
    required this.viewHistoryTextColor,
    required this.titleFontSize,
    required this.viewHistoryFontSize,
    required this.activityIconSize,
    required this.activityIconColor,
    required this.activityTextSize,
    required this.activityTextColor,
    required this.width,
    required this.height,
    required this.borderColor,
    required this.borderWidth,
    required this.paddingDx,
    required this.paddingDy,
    required this.borderRadius,
    required this.activityText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: paddingDx, vertical: paddingDy),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle tap
                  },
                  child: Text(
                    viewHistoryText,
                    style: TextStyle(
                      fontSize: viewHistoryFontSize,
                      fontWeight: FontWeight.bold,
                      color: Color(int.parse(viewHistoryTextColor)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Icon(
                    Icons.person_outlined,
                    color: Color(int.parse(activityIconColor)),
                    size: activityIconSize,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  activityText,
                  style: TextStyle(
                    fontSize: activityTextSize,
                    color: Color(int.parse(activityTextColor)),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Icon(
                    Icons.person_outlined,
                    color: Color(int.parse(activityIconColor)),
                    size: activityIconSize,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  activityText,
                  style: TextStyle(
                    fontSize: activityTextSize,
                    color: Color(int.parse(activityTextColor)),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
