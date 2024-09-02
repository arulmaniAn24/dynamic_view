import 'package:flutter/material.dart';

class ChoicechipWithTitleNumberPrototype extends StatefulWidget {
  const ChoicechipWithTitleNumberPrototype({
    super.key,
  });

  @override
  ChoicechipWithTitleNumberPrototypeState createState() =>
      ChoicechipWithTitleNumberPrototypeState();
}

class ChoicechipWithTitleNumberPrototypeState
    extends State<ChoicechipWithTitleNumberPrototype> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 150,
      child: ChoiceChip(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        label: Text(
          "Inprogress (5)",
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF0000FF),
          ),
        ),
        selected: isSelected,
        onSelected: (bool selected) {
          setState(() {
            isSelected = selected;
          });
        },
        checkmarkColor: Colors.white,
        backgroundColor: Colors.white,
        selectedColor: const Color(0xFF0000FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(
            color: Color(0xFF0000FF),
          ),
        ),
      ),
    );
  }
}
