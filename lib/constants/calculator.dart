import 'dart:math';

import 'package:bmi_calculator/provider/calculator_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Map<String, String> getResult(WidgetRef ref) {
  final Map<String, dynamic> calculation = ref.watch(calculatorProvider);
  final int weight = calculation['weight'];
  final double height = calculation['height'];
  final double bmi = weight / pow(height / 100, 2);
  Map<String, String> result = {};
  if (bmi >= 25) {
    result = {
      'state': 'Overweight',
      'bmi': bmi.toStringAsFixed(1),
      'comment':
          'You have a higher than normal body weight. Try to exercise more.',
    };
  } else if (bmi > 18.5) {
    result = {
      'state': 'Normal',
      'bmi': bmi.toStringAsFixed(1),
      'comment': 'You have a normal body weight. Good job!',
    };
  } else {
    result = {
      'state': 'Underweight',
      'bmi': bmi.toStringAsFixed(1),
      'comment':
          'You have a lower than normal body weight. You can eat a bit more.',
    };
  }
  return result;
}
