import 'package:bmi_calculator/core/extensions/num.dart';
import 'package:bmi_calculator/core/route_utils/route_utils.dart';
import 'package:bmi_calculator/core/utils/colors.dart';
import 'package:bmi_calculator/widgets/app_app_bar.dart';
import 'package:bmi_calculator/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/app/counter_card.dart';
import '../../widgets/app/gender_choice_card.dart';
import '../result /view.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {

  int height = 175;
  int weight = 80;
  bool isMale = true;

  double calculate() {
    final heightInMeter = height / 100;
    return weight / (heightInMeter * heightInMeter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "BMI Calculator",
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GenderChoiceCard(
                      title: 'Male',
                      icon: FontAwesomeIcons.person,
                      isSelected: isMale,
                      onTap: () => setState(() => isMale = true),
                    ),
                  ),
                  SizedBox(width: 16.width),
                  Expanded(
                    child: GenderChoiceCard(
                      title: 'Female',
                      icon: FontAwesomeIcons.personDress,
                      isSelected: !isMale,
                      onTap: () => setState(() => isMale = false),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.height),
            CounterCard(
              count: '$height',
              title: 'Height (in cm)',
              onPlus: () => height < 220 ? setState(() => height++) : null,
              onMinus: () => height > 40 ? setState(() => height--) : null,
            ),
            SizedBox(height: 16.height),
            CounterCard(
              count: '$weight',
              title: 'Weight (in kg)',
              onPlus: () => setState(() => weight++),
              onMinus: () => weight > 5 ? setState(() => weight--) : null,
            ),
            SizedBox(height: 40.height),
            SafeArea(
              child: AppButton(
                title: 'Calculate',
                onTap: () {
                  RouteUtils.push(context, ResultView(result: calculate()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
