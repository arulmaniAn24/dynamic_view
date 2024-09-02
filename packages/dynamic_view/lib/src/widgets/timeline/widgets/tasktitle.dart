import 'package:flutter/material.dart';

class Tasktile extends StatefulWidget {
  const Tasktile({super.key});

  @override
  State<Tasktile> createState() => _TasktileState();
}

class _TasktileState extends State<Tasktile> {
  final List<Map<String, String>> events = [
    {"time": "09:00 am", "title": "Design System", "slot":"09:00 - 10:00"},
    {"time": "10:00 am", "title": "Create Prototype", "slot":"10:00 - 11:00"},
    {"time": "11:00 am", "title": "Development", "slot":"11:00 - 12:00"},
    {"time": "12:00 pm", "title": "Dashboard design", "slot":"12:00 - 1:00"},
    // Add more events here
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return TimelineItem(
            time: event["time"]!,
            title: event["title"]!,
            slot: event["slot"]!,
          );
        },
      ),
    );
  }
}

class TimelineItem extends StatelessWidget {
  final String time;
  final String title;
  final String slot;

  const TimelineItem({super.key, required this.time, required this.title, required this.slot});

  @override
  Widget build(BuildContext context) {
    // Example profile images
    final List<String> profileImages = [
      'assets/images/profile.jpg',
      'assets/images/profile.jpg',
      'assets/images/profile.jpg',
      'assets/images/profile.jpg',
    ];
    const int maxProfiles = 2;

    final timeParts = time.split(' ');
    final timeOnly = timeParts[0];
    final period = timeParts[1];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time Column
          SizedBox(
            width: 80,
            child: Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Text.rich(
                TextSpan(
                  text: timeOnly,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  children: [
                    TextSpan(
                      text: '\n$period',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          // Details Column inside Card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Stack(
                children: [
                  Card(
                    color: Colors.grey[50],
                    margin: const EdgeInsets.only(left: 16.0),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.access_time_outlined, size: 16,),
                              const SizedBox(width: 5,),
                              Text(slot,style: const TextStyle(fontSize: 16),),
                            ],
                          ),
                          const SizedBox(height: 12),
                          // Progress Bar
                          const Padding(
                            padding: EdgeInsets.only(left :6.0),
                            child: DashedProgressBar(
                              value: 0.3,
                              progress: 8,
                              total: 10, 
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 4,
                    child: IconButton(
                      icon: const Icon(Icons.more_horiz),
                      onPressed: () {
                        // Handle menu icon tap
                        print("Menu icon tapped for $title");
                      },
                    ),
                  ),
                 Positioned(
                    bottom: 8,
                    right: 8,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       for (int i = 0; i < profileImages.length && i < maxProfiles; i++)
                          Align(
                            widthFactor: 0.5,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundImage: AssetImage(profileImages[i]),
                            ),
                          ),
                        if (profileImages.length > maxProfiles)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor:const Color.fromARGB(255, 8, 14, 83),
                              child: Text(
                                '+${profileImages.length - maxProfiles}',
                                style: const TextStyle(fontSize: 12, color: Colors.white),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashedProgressBar extends StatelessWidget {
  final double value; 
  final int progress;
  final int total;

  const DashedProgressBar({super.key, required this.value,required this.progress,required this.total});
@override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 300,
          height: 6,
          child: CustomPaint(
            painter: DashedProgressBarPainter(value: value),
          ),
        ),
        Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Progress',style: TextStyle(fontSize: 8,color: Colors.grey),),
          const SizedBox(width: 45,),
            Text(
              '$progress/$total',
              style: const TextStyle(fontSize: 8, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}

class DashedProgressBarPainter extends CustomPainter {
  final double value; 

  DashedProgressBarPainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 8, 14, 83)
      ..strokeWidth = size.height
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const dashWidth = 15.0; 
    const dashSpace = 10.0;
    const totalWidth = dashWidth + dashSpace;
    final totalLength = size.width * value;

    for (double i = 0; i < totalLength; i += totalWidth) {
      canvas.drawLine(
        Offset(i, size.height / 2),
        Offset(i + dashWidth, size.height / 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
