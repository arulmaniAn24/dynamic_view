import 'package:flutter/material.dart';

class CardGridviewTitleDescription extends StatefulWidget {
  const CardGridviewTitleDescription({super.key});

  @override
  State<CardGridviewTitleDescription> createState() =>
      _CardGridviewTitleDescriptionState();
}

class _CardGridviewTitleDescriptionState
    extends State<CardGridviewTitleDescription> {
  final List<Map<String, String>> tasks = [
    {
      'title': 'Task',
      'description':
          'when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return GridCardWithTitleDescription(
            title: tasks[index]['title']!,
            description: tasks[index]['description']!,
          );
        },
      ),
    );
  }
}

class GridCardWithTitleDescription extends StatelessWidget {
  final String title;
  final String description;

  const GridCardWithTitleDescription(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: const Icon(
                    Icons.person,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
