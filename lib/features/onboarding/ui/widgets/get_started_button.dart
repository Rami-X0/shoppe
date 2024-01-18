import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_text_button.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextButton(
          onPressed: () {},
          text: 'Let\'s get started',
          textStyle: TextStyles.font22WhiteLight,
        ),
        verticalSpace(18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'I already have an account',
              style: TextStyles.font15DarkBlueLight,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    35.w,
                    35.h,
                  ),
                  shape: const CircleBorder(),
                  backgroundColor: ColorsManager.mainBlue),
              onPressed: () {},
              child: FaIcon(
                FontAwesomeIcons.arrowRight,
                size: 15.w,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}
