import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
                    text: AppLocalizations.of(context)!.categories,
                    style: TextStyles.font18MainBlueSemiBold),
                WidgetSpan(
                  child: horizontalSpace(170),
                ),
                TextSpan(
                  text: AppLocalizations.of(context)!.see_more,
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
