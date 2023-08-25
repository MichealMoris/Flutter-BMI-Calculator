import 'package:bmi_calculator/constants/colors.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final String state;
  final String bmiResult;
  final String comment;
  const ResultCard({
    super.key,
    required this.state,
    required this.bmiResult,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              state,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: state.toLowerCase() == 'normal'
                        ? successColor
                        : state.toLowerCase() == 'underweight'
                            ? warningColor
                            : dangerColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Spacer(),
            Text(
              bmiResult,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Spacer(),
            Text(
              comment,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
