import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class CustomPaddingTextfield extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final IconData icon;
  final double width;
  final String title;
  final int limitDigits;

  const CustomPaddingTextfield({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.icon,
    required this.width,
    required this.title,
    required this.limitDigits,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
        const Gap(5),
        SizedBox(
          width: width,
          child: TextField(
            controller: controller,
            onChanged: (value) {
              double parsedValue = double.tryParse(value) ?? 14;
              onChanged(parsedValue.toString());
            },
            cursorColor: Colors.white,
            decoration: InputDecoration(
              isDense: true,
              icon: Icon(
                icon,
                color: Colors.white,
              ),
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            keyboardType: TextInputType.number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
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
