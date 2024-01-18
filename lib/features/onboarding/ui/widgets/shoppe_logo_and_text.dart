import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/styles.dart';

class ShoppeLogoAndText extends StatelessWidget {
  const ShoppeLogoAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            'assets/images/shoppe_logo.png',
            width: 143.w,
            height: 143.h,
          ),
        ),
         verticalSpace(5),
        Text(
          'Shoppe',
          style: TextStyles.font50DarkBlueBold,
        ),
        verticalSpace(18),
        Text(
          'Best products in the market of 2024 \nwith the highest quality you will find.',
          textAlign: TextAlign.center,
          style: TextStyles.font19DarkBlueLight,
        ),
        verticalSpace(105),
      ],
    );
  }
}
