import 'package:bmi_calculator/core/extensions/num.dart';
import 'package:bmi_calculator/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/utils/colors.dart';

class CounterCard extends StatelessWidget {
  const CounterCard({
    Key? key,
    required this.count,
    required this.title,
  }) : super(key: key);

  final String count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.width,
              ),
              child: Row(
                children: [
                  _CountButton(
                    icon: FontAwesomeIcons.minus,
                    onTap: () {},
                  ),
                  Expanded(
                    child: AppText(
                      title: '$count',
                      fontWeight: FontWeight.w700,
                      fontSize: 40.font,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _CountButton(
                    icon: FontAwesomeIcons.plus,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.font),
            AppText(
              title: title,
              color: AppColors.grey,
              fontSize: 18.font,
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.grey.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}

class _CountButton extends StatelessWidget {
  const _CountButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(200.radius),
      child: Container(
        padding: EdgeInsets.all(12.height),
        child: Icon(
          icon,
          size: 20.height,
          color: AppColors.darkGrey,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.grey.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
