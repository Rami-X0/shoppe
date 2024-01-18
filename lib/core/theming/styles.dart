import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/font_weight_helper.dart';

class TextStyles {
  static TextStyle font50DarkBlueBold = TextStyle(
    fontSize: 50.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.darkBlue,
  );
  static TextStyle font19DarkBlueLight = TextStyle(
    fontSize: 19.sp,
    fontWeight: FontWeightHelper.light,
    color: ColorsManager.darkBlue,
  );
  static TextStyle font22WhiteLight = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.light,
    color: Colors.white,
  );
  static TextStyle font15DarkBlueLight = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.light,
    color: ColorsManager.darkBlue,
  );
}
