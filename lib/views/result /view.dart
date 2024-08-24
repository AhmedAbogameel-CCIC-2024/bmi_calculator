import 'package:bmi_calculator/core/extensions/build_context.dart';
import 'package:bmi_calculator/core/extensions/num.dart';
import 'package:bmi_calculator/core/utils/colors.dart';
import 'package:bmi_calculator/widgets/app_app_bar.dart';
import 'package:bmi_calculator/widgets/app_text.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key}) : super(key: key);

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
                title: '34.6',
                fontSize: 50.font,
                fontWeight: FontWeight.w700,
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
