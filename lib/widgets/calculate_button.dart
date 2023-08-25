import 'package:bmi_calculator/constants/colors.dart';
import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CalculateButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        backgroundColor: decorationColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
