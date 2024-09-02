import 'package:flutter/material.dart';

class CardWithProgressbarImagePrototype extends StatelessWidget {
  const CardWithProgressbarImagePrototype({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
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
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Task",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Completed 6',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFFFF0000),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "4 task left to do",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF757575),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[200],
                    child: const Icon(
                      Icons.person_outline,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 65 / 100,
                      backgroundColor: Colors.grey[300],
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
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
