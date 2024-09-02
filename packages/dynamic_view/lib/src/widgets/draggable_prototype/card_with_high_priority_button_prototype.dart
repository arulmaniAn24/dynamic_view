import 'package:flutter/material.dart';

class CardWithHighPriorityButtonPrototype extends StatelessWidget {
  const CardWithHighPriorityButtonPrototype({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 250,
      child: Column(
        children: [
          Card(
            color: Colors.blueGrey[50],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Meeting",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 20,
                        height: 20,
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
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            size: 8,
                            color: Colors.black,
                          ),
                          Text(
                            "09.00 AM - 10.00 AM",
                            style: TextStyle(
                              fontSize: 8.0,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 20,
                        width: 90,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              //  backgroundColor: widget.buttonColor,
                              ),
                          child: const Text(
                            "High Priority",
                            style: TextStyle(
                              fontSize: 6,
                            ),
                          ),
                        ),
                      ),
                    ],
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
