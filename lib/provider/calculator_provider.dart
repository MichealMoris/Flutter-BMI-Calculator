import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorNotifier extends StateNotifier<Map<String, dynamic>> {
  CalculatorNotifier()
      : super({
          'gender': 'male',
          'height': 180.0,
          'weight': 60,
          'age': 18,
        });

  void changeValue(String property, dynamic newValue) {
    state = {
      ...state,
      property: newValue,
    };
  }
}

final calculatorProvider =
    StateNotifierProvider<CalculatorNotifier, Map<String, dynamic>>(
        (ref) => CalculatorNotifier());
