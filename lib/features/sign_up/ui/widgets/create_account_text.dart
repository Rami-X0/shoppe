import 'package:flutter/material.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';

class CreateAccountText extends StatelessWidget {
  const CreateAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create Account',
          style: TextStyles.font50MainBlueBold.copyWith(
            fontSize: 30,
          ),
        ),
        Text(
          'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome \nyou to our community!',
          style: TextStyles.font15DarkBlueRegular
              .copyWith(color: ColorsManager.grey),
        ),
      ],
    );
  }
}
