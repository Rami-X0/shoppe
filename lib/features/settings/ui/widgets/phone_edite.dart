import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/settings/data/models/profile_response.dart';
import 'package:shoppe/features/settings/ui/widgets/phone_form.dart';
import 'package:shoppe/features/settings/ui/widgets/settings_dialog.dart';

class PhoneEdite extends StatelessWidget {
  final ProfileResponse profileResponse;

  const PhoneEdite({
    super.key,
    required this.profileResponse,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: InkWell(
        onTap: () {
          showDialog(
            barrierDismissible: false,
            useRootNavigator: false,
            context: context,
            builder: (context) {
              return  SettingsDialog(
                height: 300,
                child: PhoneForm(profileResponse: profileResponse,),
              );
            },
          );
        },
        child: Row(
          children: [
            Gap(10.w),
            FaIcon(
              FontAwesomeIcons.phone,
              color: ColorsManager.mainBlue,
              size: 18.w,
            ),
            Gap(10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Phone',
                  style: TextStyles.font13DarkBlueRegular,
                ),
                Text(
                   profileResponse.userData!.phone.toString(),
                  style: TextStyles.font15MainBlueSemiBold,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
