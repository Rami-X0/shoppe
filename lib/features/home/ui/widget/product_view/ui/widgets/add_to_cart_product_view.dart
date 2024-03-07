import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_text_button.dart';

class AddToCartProductView extends StatelessWidget {
  const AddToCartProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
                color: ColorsManager.mainBlue.withOpacity(0.5), width: 1.5),
          ),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.solidCreditCard,
              color: ColorsManager.mainBlue,
              size: 32.w,
            ),
          ),
        ),
        const Spacer(),
        AppTextButton(
          onPressed: () {},
          border: 5,
          shadowColor: ColorsManager.mainBlue.withOpacity(0.2),
          verticalSize: 55,
          horizontalSize: 240,
          text: 'Pay',
          textStyle: TextStyles.font22WhiteBold,
        ),
      ],
    );
  }
}
