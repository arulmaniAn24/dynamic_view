import 'package:flutter/material.dart';

class CardWithSlider extends StatelessWidget {
  final double width;
  final double height;
  final double textFontSize;
  final double timeFontSize;
  final List<Map<String, String>> meetings;
  final double paddingDx;
  final double paddingDy;

  const CardWithSlider({
    super.key,
    required this.width,
    required this.textFontSize,
    required this.timeFontSize,
    required this.paddingDx,
    required this.paddingDy,
    required this.height,
    required this.meetings,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: paddingDx, vertical: paddingDy),
        child: SizedBox(
          height: 120.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: generateMeetingCards(),
          ),
        ),
      ),
    );
  }

  List<Widget> generateMeetingCards() {
    //   List<Map<String, String>> meetings = [
    //   {'title': 'Meeting 1', 'time': '09:00 AM - 10:00 AM'},
    //   {'title': 'Meeting 2', 'time': '10:00 AM - 11:00 AM'},
    //   {'title': 'Meeting 3', 'time': '11:00 AM - 12:00 PM'},
    //   {'title': 'Meeting 4', 'time': '01:00 PM - 02:00 PM'},
    // ];
    return meetings.map((meeting) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          color: Colors.blueGrey[50],
          child: Container(
            width: width,
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meeting['title']!,
                  style: TextStyle(
                    fontSize: textFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.access_time_outlined,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      meeting['time']!,
                      style: TextStyle(
                        fontSize: timeFontSize,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}
