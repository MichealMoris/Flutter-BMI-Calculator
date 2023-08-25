import 'package:bmi_calculator/constants/calculator.dart';
import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/widgets/calculate_button.dart';
import 'package:bmi_calculator/widgets/main_app_bar.dart';
import 'package:bmi_calculator/widgets/result_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = getResult(ref);
    return Scaffold(
      backgroundColor: mainColor,
      appBar: const MainAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Your Result',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 30,
              ),
              ResultCard(
                state: result['state']!,
                bmiResult: result['bmi']!,
                comment: result['comment']!,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: CalculateButton(
                      text: 'Re-Calculate',
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
