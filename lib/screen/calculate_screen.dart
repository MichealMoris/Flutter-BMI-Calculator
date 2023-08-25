import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/provider/calculator_provider.dart';
import 'package:bmi_calculator/screen/result_screen.dart';
import 'package:bmi_calculator/widgets/calculate_button.dart';
import 'package:bmi_calculator/widgets/counter.dart';
import 'package:bmi_calculator/widgets/gender_button.dart';
import 'package:bmi_calculator/widgets/height_slider.dart';
import 'package:bmi_calculator/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Calculate extends ConsumerWidget {
  const Calculate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculationsNotifier = ref.watch(calculatorProvider.notifier);
    final calculations = ref.watch(calculatorProvider);
    final gender = calculations['gender'];
    final weight = calculations['weight'];
    final age = calculations['age'];
    return Scaffold(
      backgroundColor: mainColor,
      appBar: const MainAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GenderButton(
                    icon: Icons.male,
                    text: 'Male',
                    onTap: () {
                      calculationsNotifier.changeValue('gender', 'male');
                    },
                    color: gender == 'male' ? clickedColor : secondaryColor,
                  ),
                  const SizedBox(
                    width: 26,
                  ),
                  GenderButton(
                    icon: Icons.female,
                    text: 'Female',
                    onTap: () {
                      calculationsNotifier.changeValue('gender', 'female');
                    },
                    color: gender == 'female' ? clickedColor : secondaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const HeightSlider(),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Counter(
                    counterName: 'Weight',
                    onIncrease: () {
                      if (weight + 1 <= 454) {
                        calculationsNotifier.changeValue('weight', weight + 1);
                      }
                    },
                    onDecrease: () {
                      if (weight - 1 >= 23) {
                        calculationsNotifier.changeValue('weight', weight - 1);
                      }
                    },
                    counter: weight,
                  ),
                  const SizedBox(
                    width: 26,
                  ),
                  Counter(
                    counterName: 'Age',
                    onIncrease: () {
                      if (age + 1 <= 122) {
                        calculationsNotifier.changeValue('age', age + 1);
                      }
                    },
                    onDecrease: () {
                      if (age - 1 >= 5) {
                        calculationsNotifier.changeValue('age', age - 1);
                      }
                    },
                    counter: age,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: CalculateButton(
                    text: 'Calculate',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) {
                          return const ResultScreen();
                        },
                      ));
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
