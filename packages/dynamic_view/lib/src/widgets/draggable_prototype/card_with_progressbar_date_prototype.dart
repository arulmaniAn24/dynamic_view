import 'package:flutter/material.dart';

class CardWithProgressbarDatePrototype extends StatelessWidget {
  const CardWithProgressbarDatePrototype({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 300,
      child: Card(
        color: const Color(0xFFE9EBF0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[200],
                    child: const Icon(
                      Icons.person_outline,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: const Color(0xFF2196F3),
                      ),
                    ),
                    child: const Text(
                      '6th August',
                      style: TextStyle(
                        color: Color(0xFF2196F3),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "Task",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'you have 4 tasks left to do',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF757575),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 65 / 100,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF32325D)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    '65%',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF32325D),
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
