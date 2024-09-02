import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomValueTextfield extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) onChanged;

  const CustomValueTextfield({
    super.key,
    required this.title,
    required this.keyboardType,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        TextField(
          controller: controller,
          onChanged: onChanged,
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          style: const TextStyle(color: Colors.white),
          keyboardType: keyboardType,
          inputFormatters: keyboardType == TextInputType.number
              ? [
                  LengthLimitingTextInputFormatter(2),
                  FilteringTextInputFormatter.digitsOnly,
                ]
              : null,
        ),
      ],
    );
  }
}
