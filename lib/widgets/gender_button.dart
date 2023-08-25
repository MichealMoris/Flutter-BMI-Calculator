import 'package:bmi_calculator/constants/colors.dart';
import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function() onTap;
  final Color color;
  const GenderButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: color),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: white,
                size: 100,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: grey,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
