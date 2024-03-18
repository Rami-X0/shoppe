import 'package:flutter/material.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateAccountText extends StatelessWidget {
  const CreateAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.create_account,
          style: TextStyles.font50MainBlueBold.copyWith(
            fontSize: 30,
          ),
        ),

        Text(
          AppLocalizations.of(context)!.signup_invitation,
          style: TextStyles.font15DarkBlueRegular
              .copyWith(color: ColorsManager.grey),
        ),
      ],
    );
  }
}
