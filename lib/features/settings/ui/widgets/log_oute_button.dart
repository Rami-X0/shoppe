import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:shoppe/core/caching/app_shared_pref.dart';
import 'package:shoppe/core/caching/app_shared_pref_key.dart';
import 'package:shoppe/core/helper/extension.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        actionLogOutButton(context);
      },
      overlayColor: MaterialStateProperty.all(ColorsManager.skyBlue),
      child: SizedBox(
        height: 50.h,
        child: Row(
          children: [
            Text(
              AppLocalizations.of(context)!.log_out,
              style: TextStyles.font15MainBlueSemiBold,
            ),
            Gap(10.w),
            const FaIcon(
              FontAwesomeIcons.rightFromBracket,
              color: ColorsManager.mainBlue,
            ),

          ],
        ),
      ),
    );
  }

  void actionLogOutButton(BuildContext context) {
    AppSharedPref.removeKey(key: AppSharedPrefKey.token);
    context.pushNamedAndRemoveUntil(Routes.loginScreen);
  }
}
