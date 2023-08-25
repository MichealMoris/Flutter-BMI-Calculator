import 'package:bmi_calculator/constants/colors.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      foregroundColor: white,
      title: const Text(
        'BMI Calculator',
      ),
      titleTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: white,
            fontWeight: FontWeight.bold,
          ),
      backgroundColor: mainColor,
      elevation: 0.5,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
