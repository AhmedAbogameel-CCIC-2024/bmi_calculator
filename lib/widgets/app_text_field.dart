import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/core/extensions/num.dart';

import '../core/utils/colors.dart';
import 'app_text.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    this.label,
    required this.hint,
    this.validator,
    this.secure = false,
    this.leading,
  }) : super(key: key);

  final String? label;
  final String hint;
  final String? Function(String? v)? validator;
  final bool secure;
  final Widget? leading;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool secure = false;

  @override
  void initState() {
    secure = widget.secure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          AppText(
            title: widget.label!,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 8.height),
        ],
        TextFormField(
          cursorColor: AppColors.primary,
          validator: widget.validator,
          obscureText: secure,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: widget.leading,
            fillColor: AppColors.lightGrey,
            filled: true,
            suffixIcon: widget.secure ? InkWell(
              onTap: () => setState(() => secure = !secure),
              child: Icon(
                secure ? FontAwesomeIcons.solidEyeSlash : FontAwesomeIcons.solidEye,
                size: 16.height,
                color: AppColors.grey,
              ),
            ) : SizedBox(),
            hintStyle: TextStyle(
              color: AppColors.darkGrey,
              fontSize: 14.font,
              fontWeight: FontWeight.w600,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.width,
            ),
            enabledBorder: getBorder(color: Colors.transparent),
            focusedBorder: getBorder(color: AppColors.grey),
            errorBorder: getBorder(color: AppColors.red),
            focusedErrorBorder: getBorder(color: AppColors.red),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder getBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.radius),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
