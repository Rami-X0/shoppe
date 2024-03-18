import 'package:flutter/material.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppPasswordValidations extends StatelessWidget {
  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMineLength;

  const AppPasswordValidations({
    super.key,
    required this.hasUpperCase,
    required this.hasLowerCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMineLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(AppLocalizations.of(context)!.validate_lowerCase, hasLowerCase),
        verticalSpace(2),
        buildValidationRow(AppLocalizations.of(context)!.validate_upperCase, hasUpperCase),
        verticalSpace(2),
        buildValidationRow(
            AppLocalizations.of(context)!.validate_character, hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow(AppLocalizations.of(context)!.validate_number, hasNumber),
        verticalSpace(2),
        buildValidationRow(AppLocalizations.of(context)!.validate_characters_8, hasMineLength),
      ],
    );
  }
}

Widget buildValidationRow(String text, bool hasValidate) {
  return Row(
    children: [
      CircleAvatar(
        backgroundColor:
            hasValidate ? ColorsManager.grey : ColorsManager.darkBlue,
        maxRadius: 3,
      ),
      horizontalSpace(3),
      Text(
        text,
        style: TextStyle(
          decoration: hasValidate ? TextDecoration.lineThrough : null,
          decorationColor: Colors.green,
          decorationThickness: 2,
          // height: 3,
          color: hasValidate ? ColorsManager.grey : ColorsManager.darkBlue,
          fontSize: 12,
        ),
      ),
    ],
  );
}
