import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/colors.dart';

class TopSwipeIcon extends StatelessWidget {
  const TopSwipeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 150.w, vertical: 10.h),
      child: Container(
        height: 8.0,
        decoration: const BoxDecoration(
          color: ColorsManager.mainBlue,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
