import 'package:bmi_calculator/core/extensions/build_context.dart';
import 'package:bmi_calculator/core/extensions/num.dart';
import 'package:bmi_calculator/core/utils/colors.dart';
import 'package:bmi_calculator/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderChoiceCard extends StatelessWidget {
  const GenderChoiceCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final unselectedColor = AppColors.grey.withOpacity(0.9);
    final selectedColor = AppColors.primary;
    final color = isSelected ? selectedColor : unselectedColor;
    return Container(
      height: context.width(2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40.height,
            color: color,
          ),
          SizedBox(height: 8.height),
          AppText(
            title: title,
            fontWeight: FontWeight.w600,
            fontSize: 16.font,
            color: color,
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color,
          width: 1.5,
        ),
      ),
    );
  }
}
