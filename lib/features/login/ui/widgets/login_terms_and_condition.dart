import 'package:flutter/material.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginTermsAndConditions extends StatelessWidget {
  const LoginTermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: AppLocalizations.of(context)!.by_logging,
              style: TextStyles.font13MoreLighterGreyRegular,
            ),
            TextSpan(
              text: AppLocalizations.of(context)!.terms_condition,
              style: TextStyles.font13DarkBlueRegular,
            ),
            TextSpan(
              text: ' ${AppLocalizations.of(context)!.and}\n',
              style: TextStyles.font13MoreLighterGreyRegular,
            ),
            TextSpan(
              text: AppLocalizations.of(context)!.an_privacy_policy,
              style: TextStyles.font13DarkBlueRegular,
            ),
          ],
        ),
      ),
    );
  }
}
