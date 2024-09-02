import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CardWithProgressbarTitleDescriptionPrototype extends StatelessWidget {
  const CardWithProgressbarTitleDescriptionPrototype({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: 300,
        height: 120,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: const Color(0xFFE9EBF0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              children: [
                CircularPercentIndicator(
                  radius: 30.0,
                  lineWidth: 8.0,
                  percent: 85 / 100,
                  center: const Text(
                    "85%",
                    style: TextStyle(
                      // color: Color(int.parse(valueColor)),
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  progressColor: const Color(0xFF32325D),
                  backgroundColor: Colors.grey[200]!,
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Task",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    SizedBox(
                      width: 110,
                      child: Text(
                        'you have 4 tasks left to do',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF757575),
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
    });
  }
}
