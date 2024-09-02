import 'package:flutter/material.dart';

class CardSliderPrototype extends StatelessWidget {
  const CardSliderPrototype({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: generateMeetingCards(),
      ),
    );
  }

  List<Widget> generateMeetingCards() {
    List<Map<String, String>> meetings = [
      {'title': 'Meeting 1', 'time': '09:00 AM - 10:00 AM'},
      {'title': 'Meeting 2', 'time': '10:00 AM - 11:00 AM'},
      {'title': 'Meeting 3', 'time': '11:00 AM - 12:00 PM'},
      {'title': 'Meeting 4', 'time': '01:00 PM - 02:00 PM'},
    ];
    return meetings.map((meeting) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Card(
          color: Colors.blueGrey[50],
          child: Container(
            width: 200,
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meeting['title']!,
                  style: const TextStyle(
                    fontSize: 14.0,
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
                      style: const TextStyle(
                        fontSize: 12.0,
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
