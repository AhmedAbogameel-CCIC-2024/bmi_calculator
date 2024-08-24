import 'package:bmi_calculator/core/extensions/build_context.dart';
import 'package:bmi_calculator/core/extensions/num.dart';
import 'package:bmi_calculator/core/utils/colors.dart';
import 'package:bmi_calculator/widgets/app_app_bar.dart';
import 'package:bmi_calculator/widgets/app_text.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({
    Key? key,
    required this.result,
  }) : super(key: key);

  final double result;

  String getResult() {
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

  Color getColor() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "Result",
      ),
      body: Center(
        child: Container(
          height: context.height(4),
          margin: EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                title: 'Your BMI is',
                color: AppColors.grey,
                fontSize: 24.font,
              ),
              SizedBox(height: 12.height),
              AppText(
                title: result.toStringAsFixed(1),
                fontSize: 50.font,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 4.height),
              AppText(
                title: '${getResult()}',
                color: getColor(),
                fontSize: 24.font,
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.radius),
            border: Border.all(
              color: AppColors.grey.withOpacity(0.8),
            )
          ),
        ),
      ),
    );
  }
}
