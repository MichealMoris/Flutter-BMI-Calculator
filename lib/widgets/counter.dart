import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/widgets/circular_button.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final String counterName;
  final void Function() onIncrease;
  final void Function() onDecrease;
  final int counter;
  const Counter({
    super.key,
    required this.counterName,
    required this.onIncrease,
    required this.onDecrease,
    required this.counter,
  });

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {},
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
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
                widget.counterName,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: grey,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                widget.counter.toString(),
                style: const TextStyle(
                  color: white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularButton(
                    onPressed: widget.onIncrease,
                    icon: const Icon(Icons.add),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircularButton(
                    onPressed: widget.onDecrease,
                    icon: const Icon(Icons.remove),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
