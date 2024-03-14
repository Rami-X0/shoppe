import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/settings/data/models/profile_response.dart';
import 'package:shoppe/features/settings/ui/widgets/edite_name_and_email.dart';

class SettingsNameAndEmail extends StatelessWidget {
  final ProfileResponse profileResponse;
  const SettingsNameAndEmail({super.key, required this.profileResponse});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            children: [
              _imageProfile(),
              Gap(10.h),
              Text(
                profileResponse.userData!.name.toString(),
                style: TextStyles.font18MainBlueSemiBold,
              ),
              Text(
                profileResponse.userData!.email.toString(),
                style: TextStyles.font14MainBlueBold.copyWith(fontSize: 10.sp),
              ),
            ],
          ),
        ),
         EditeNameAndEmail(profileResponse: profileResponse,)
      ],
    );
  }

  Widget _imageProfile() {
    return CircleAvatar(
      backgroundColor: ColorsManager.skyBlue,
      maxRadius: 50.w,
      child: SvgPicture.asset(
        'assets/svgs/profile.svg',
        width: 75.w,
      ),
    );
  }

}
