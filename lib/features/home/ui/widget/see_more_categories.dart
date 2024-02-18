import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/styles.dart';

class SeeMoreCategories extends StatelessWidget {
  const SeeMoreCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        children: [


          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'Categories',
                    style: TextStyles.font18DarkBlueSemiBold),
                WidgetSpan(
                  child: horizontalSpace(170),
                ),
                TextSpan(
                  text: 'See more',
                  style: TextStyles.font13MoreLighterGreyRegular,
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
