import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/styles.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> appSnackBar({
  required String text,
  required Color backGroundColor,
  required context,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text,
          style: TextStyles.font22WhiteBold.copyWith(
            fontSize: 15.sp,
          )),
      duration: const Duration(milliseconds: 1000),
      backgroundColor: backGroundColor,
      behavior: SnackBarBehavior.fixed,
      elevation: 3,
    ),
  );
}
