import 'package:bmi_calculator/core/extensions/build_context.dart';
import 'package:bmi_calculator/core/extensions/num.dart';
import 'package:bmi_calculator/core/utils/colors.dart';
import 'package:bmi_calculator/views/calculator/controller.dart';
import 'package:bmi_calculator/widgets/app_app_bar.dart';
import 'package:bmi_calculator/widgets/app_text.dart';
import 'package:flutter/material.dart';

class ResultView extends StatefulWidget {
  ResultView({
    Key? key,
    required this.result,
  }) : super(key: key);

  final double result;

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {

  late CalculatorController _controller;

  @override
  void initState() {
    _controller = CalculatorController(state: this);
    super.initState();
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
                title: widget.result.toStringAsFixed(1),
                fontSize: 50.font,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 4.height),
              AppText(
                title: '${_controller.getResult(widget.result)}',
                color: _controller.getColor(widget.result),
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
