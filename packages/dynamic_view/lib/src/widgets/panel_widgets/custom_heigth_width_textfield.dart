import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class CustomHeigthWidthTextfield extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final String title;
  final int limitDigits;
  final ValueChanged<String> onChanged;

  const CustomHeigthWidthTextfield({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.limitDigits,
    required this.title,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        const Gap(5),
        SizedBox(
          width: width,
          child: TextField(
            controller: controller,
            onChanged: (value) {
              onChanged(value);
            },
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            keyboardType: TextInputType.number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(limitDigits),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
      ],
    );
  }
}
