import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/colors.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final TextStyle textStyle;
  final Color? backGroundColor;
  final double? verticalSize;
  final double? horizontalSize;
  final double? border;
  final Color? shadowColor;
  final double? elevationShadow;

  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.textStyle,
    this.backGroundColor,
    this.verticalSize,
    this.horizontalSize,
    this.border,
    this.shadowColor,
    this.elevationShadow,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        animationDuration: const Duration(milliseconds: 750),
        elevation: MaterialStateProperty.all(elevationShadow ?? 5),
        shadowColor:
            MaterialStateProperty.all(shadowColor ?? ColorsManager.darkBlue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              border ?? 16,
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          backGroundColor ?? ColorsManager.mainBlue,
        ),
        minimumSize: MaterialStateProperty.all(
          Size(
            horizontalSize ?? 335.w,
            verticalSize ?? 77.h,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
