import 'package:flutter/material.dart';
import 'package:shoppe/core/theming/styles.dart';

class AppTermsAndConditions extends StatelessWidget {
  const AppTermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our ',
            style: TextStyles.font13MoreLighterGreyRegular,
          ),
          TextSpan(
            text: 'Terms & Conditions ',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: 'and\n ',
            style: TextStyles.font13MoreLighterGreyRegular,
          ),
          TextSpan(
            text: 'PrivacyPolicy.',
            style: TextStyles.font13DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
