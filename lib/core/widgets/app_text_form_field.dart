import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final Widget? labelText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final double borderRadius = 16;
  final bool? obscureText;
  final Function(String?) validator;
  final TextEditingController? controller;

  const AppTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.contentPadding,
    this.obscureText,
    required this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return validator(value);
      },
      controller: controller,
      obscureText: obscureText ?? false,
      cursorOpacityAnimates: true,
      decoration: InputDecoration(
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              vertical: 17,
              horizontal: 20,
            ),
        label:labelText,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: ColorsManager.lightGray,
            width: 1.3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: ColorsManager.mainBlue,
            width: 1.3,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 19.h,
            horizontal: 20.w,
          ),
          child: suffixIcon,
        ),
        isDense: true,
        filled: true,
        fillColor: ColorsManager.mainBlue.withOpacity(0.1),
      ),
    );
  }
}
