import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:shoppe/core/widgets/app_icon_button_and_tool_tip.dart';
import 'package:shoppe/features/settings/data/models/profile_response.dart';
import 'package:shoppe/features/settings/ui/widgets/edite_profile_button.dart';
import 'package:shoppe/features/settings/ui/widgets/message_error_edite_profile.dart';
import 'package:shoppe/features/settings/ui/widgets/setting_close_button.dart';
import 'package:shoppe/features/settings/ui/widgets/settings_dialog.dart';
import 'package:shoppe/features/settings/ui/widgets/profile_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class EditeNameAndEmailIcon extends StatelessWidget {
  final ProfileResponse profileResponse;

  const EditeNameAndEmailIcon({super.key, required this.profileResponse});

  @override
  Widget build(BuildContext context) {
    return AppIconButtonAndToolTip(
      toolTipMessage: AppLocalizations.of(context)!.edite,
      icon: FontAwesomeIcons.userPen,
      onTap: () {
        showDialog(
          useRootNavigator: false,
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return SettingsDialog(
              height: 425,
              child: Column(
                children: [
                  Gap(8.h),
                  const SettingsCloseButton(),
                  Gap(0.h),
                  const MessageErrorEditeProfile(),
                  Gap(5.h),
                  ProfileForm(
                    profileResponse: profileResponse,
                  ),
                  Gap(15.h),
                  EditeProfileButton(
                    profileResponse: profileResponse,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }


}
