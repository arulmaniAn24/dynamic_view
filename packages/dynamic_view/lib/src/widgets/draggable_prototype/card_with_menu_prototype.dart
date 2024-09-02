import 'package:flutter/material.dart';

class CardWithMenuPrototype extends StatelessWidget {
  const CardWithMenuPrototype({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 180,
      decoration: BoxDecoration(
        color: const Color(0xFFE9EBF0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  "Task",
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Spacer(),
                Icon(Icons.more_vert),
              ],
            ),
            const SizedBox(height: 8.0),
            const Text(
              'when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived.',
              style: TextStyle(
                color: Color(0xFF525F7F),
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue,
                backgroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFF2196F3)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Inprogress',
                style: TextStyle(
                  color: Color(0xFF2196F3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
