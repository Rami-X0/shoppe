import 'package:flutter/material.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';

class AppHaveAccount extends StatelessWidget {
  final String text;
  final String textButton;
  final VoidCallback onPressed;

  const AppHaveAccount({
    super.key,
    required this.onPressed,
    required this.text,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular,
        ),
        horizontalSpace(3),
        InkWell(
          onTap: onPressed,
          child: Text(
            textButton,
            style: TextStyles.font13DarkBlueRegular.copyWith(
              color: ColorsManager.mainBlue,
            ),
          ),
        ),
      ],
    );
  }
}
