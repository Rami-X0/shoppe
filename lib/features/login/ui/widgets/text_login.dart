import 'package:flutter/material.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TextLogin extends StatelessWidget {
  const TextLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.login,
          style: TextStyles.font50MainBlueBold,
        ),
        Text(
          AppLocalizations.of(context)!.good_see_you,
          style: TextStyles.font15DarkBlueRegular
              .copyWith(color: ColorsManager.grey),
        ),
      ],
    );
  }
}
