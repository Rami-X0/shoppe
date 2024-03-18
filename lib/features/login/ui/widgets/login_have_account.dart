import 'package:flutter/material.dart';
import 'package:shoppe/core/helper/extension.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginHaveAccount extends StatelessWidget {


  const LoginHaveAccount({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.no_have_account,
          style: TextStyles.font13DarkBlueRegular,
        ),
        horizontalSpace(3),
        InkWell(
          onTap: (){
            context.pushNamed(
                Routes.signUpScreen);
          },
          child: Text(
            AppLocalizations.of(context)!.create_account,
            style: TextStyles.font13DarkBlueRegular.copyWith(
              color: ColorsManager.mainBlue,
            ),
          ),
        ),
      ],
    );
  }
}
