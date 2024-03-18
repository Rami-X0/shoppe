import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/colors.dart';

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: ColorsManager.skyBlue,
      indent: 5.w,
      endIndent: 5.w,
      thickness: 1.h,
    );
  }
}
