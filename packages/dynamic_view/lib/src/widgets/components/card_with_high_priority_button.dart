import 'package:flutter/material.dart';

class CardWithHighPriorityButton extends StatelessWidget {
  final double width;
  final double height;
  final double paddingDx;
  final double paddingDy;
  final double titleFontSize;
  final double timeFontSize;
  final String buttonColor;
  final String buttonText;
  final String title;
  final String time;

  const CardWithHighPriorityButton({
    super.key,
    required this.width,
    required this.height,
    required this.paddingDx,
    required this.paddingDy,
    required this.titleFontSize,
    required this.timeFontSize,
    required this.buttonColor,
    required this.buttonText,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: paddingDx, vertical: paddingDy),
        child: Expanded(
          child: ListView(
            children: [
              Stack(
                children: [
                  Card(
                    color: Colors.blueGrey[50],
                    margin: const EdgeInsets.only(bottom: 14),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.access_time_outlined,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  time,
                                  style: TextStyle(
                                    fontSize: timeFontSize,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 16,
                    bottom: 30,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          //  backgroundColor: widget.buttonColor,
                          ),
                      child: Text(
                        buttonText,
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 16,
                    top: 16,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_outward_outlined,
                        // color: widget.buttonColor,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
