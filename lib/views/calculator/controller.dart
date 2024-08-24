import 'dart:ui';

import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';

class CalculatorController {

  CalculatorController({required this.state});
  final State state;

  int height = 175;
  int weight = 80;
  bool isMale = true;

  void changeGender(bool isMale) {
    this.isMale = isMale;
    state.setState(() {});
  }

  void increaseHeight() {
    if (height < 220) {
      state.setState(() => height++);
    }
  }

  void decreaseHeight() {
    if (height > 40) {
      state.setState(() => height--);
    }
  }

  void increaseWeight() {
    state.setState(() => weight++);
  }

  void decreaseWeight() {
    if (weight > 5) {
      state.setState(() => weight--);
    }
  }

  double calculate() {
    final heightInMeter = height / 100;
    return weight / (heightInMeter * heightInMeter);
  }

  String getResult(double result) {
    if (result < 18.5) {
      return "Underweight";
    } else if (result >= 18.5 && result < 25) {
      return 'Normal';
    } else if (result >= 25 && result < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  Color getColor(double result) {
    if (result < 18.5) {
      return AppColors.grey;
    } else if (result >= 18.5 && result < 25) {
      return Colors.yellow;
    } else if (result >= 25 && result < 30) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
