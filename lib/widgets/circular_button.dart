import 'package:bmi_calculator/constants/colors.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget icon;
  const CircularButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: const ShapeDecoration(
          color: grey,
          shape: CircleBorder(),
        ),
        child: IconButton(
          icon: icon,
          color: Colors.white,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
