import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/provider/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeightSlider extends ConsumerStatefulWidget {
  const HeightSlider({super.key});

  @override
  ConsumerState<HeightSlider> createState() => _HeightSliderState();
}

class _HeightSliderState extends ConsumerState<HeightSlider> {
  @override
  Widget build(BuildContext context) {
    final calculationsNotifier = ref.watch(calculatorProvider.notifier);
    final calculations = ref.watch(calculatorProvider);
    double currentVal = calculations['height'];
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: secondaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Height',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: grey,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: currentVal.toStringAsFixed(0),
                    style: const TextStyle(
                      color: white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text: 'cm',
                    style: TextStyle(
                      color: grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Slider(
                activeColor: decorationColor,
                value: currentVal,
                max: 240,
                min: 60,
                onChanged: (val) {
                  calculationsNotifier.changeValue('height', val);
                }),
          ],
        ),
      ),
    );
  }
}
