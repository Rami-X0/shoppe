import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/styles.dart';

class ShoppeLogoAndText extends StatelessWidget {
  const ShoppeLogoAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    offset: const Offset(0, 4),
                    spreadRadius: 4,
                    blurRadius: 10),
              ],
            ),
            child: SvgPicture.asset(
              'assets/svgs/shoppe_logo.svg',
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
      ),
    );
  }
}
