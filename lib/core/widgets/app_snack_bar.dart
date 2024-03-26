import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> appSnackBar({
  required String text,
  required Color backGroundColor,
  required context,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Text(
            text,
            style: TextStyles.font22WhiteBold.copyWith(
              fontSize: 15.sp,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: CircleAvatar(
              backgroundColor: ColorsManager.white.withOpacity(0.2),
              maxRadius: 10.w,
              child: FaIcon(
                FontAwesomeIcons.x,
                size: 8.w,
                color: ColorsManager.white,
              ),
            ),
          ),
        ],
      ),
      duration: const Duration(milliseconds: 1000),
      hitTestBehavior: HitTestBehavior.opaque,
      backgroundColor: backGroundColor,
      elevation: 3,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 75.h),
    ),
  );
}
