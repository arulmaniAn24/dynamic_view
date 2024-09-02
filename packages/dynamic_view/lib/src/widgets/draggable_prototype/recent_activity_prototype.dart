import 'package:flutter/material.dart';

class RecentActivityPrototype extends StatelessWidget {
  const RecentActivityPrototype({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 250,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent Activity",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle tap
                    },
                    child: const Text(
                      "View History",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF053863),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    child: Icon(
                      Icons.person_outlined,
                      color: Color(0xFF9E9E9E),
                      size: 12.0,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Loren created a new task #231",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.normal,
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
