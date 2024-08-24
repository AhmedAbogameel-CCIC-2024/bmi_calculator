import 'package:bmi_calculator/core/extensions/num.dart';
import 'package:bmi_calculator/core/route_utils/route_utils.dart';
import 'package:bmi_calculator/core/utils/colors.dart';
import 'package:bmi_calculator/views/calculator/controller.dart';
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
                      isSelected: _controller.isMale,
                      onTap: () => _controller.changeGender(true),
                    ),
                  ),
                  SizedBox(width: 16.width),
                  Expanded(
                    child: GenderChoiceCard(
                      title: 'Female',
                      icon: FontAwesomeIcons.personDress,
                      isSelected: !_controller.isMale,
                      onTap: () => _controller.changeGender(false),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.height),
            CounterCard(
              count: '${_controller.height}',
              title: 'Height (in cm)',
              onPlus: _controller.increaseHeight,
              onMinus: _controller.decreaseHeight,
            ),
            SizedBox(height: 16.height),
            CounterCard(
              count: '${_controller.weight}',
              title: 'Weight (in kg)',
              onPlus: _controller.increaseWeight,
              onMinus: _controller.decreaseWeight,
            ),
            SizedBox(height: 40.height),
            SafeArea(
              child: AppButton(
                title: 'Calculate',
                onTap: () {
                  RouteUtils.push(
                    context,
                    ResultView(
                      result: _controller.calculate(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
