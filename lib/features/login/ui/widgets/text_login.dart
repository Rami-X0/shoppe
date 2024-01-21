import 'package:flutter/material.dart';
import 'package:shoppe/core/theming/styles.dart';

class TextLogin extends StatelessWidget {
  const TextLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Login',
          style: TextStyles.font50DarkBlueBold,
        ),
        Text(
          'Good to see you back!',
          style: TextStyles.font19DarkBlueLight,
        ),
      ],
    );
  }
}
