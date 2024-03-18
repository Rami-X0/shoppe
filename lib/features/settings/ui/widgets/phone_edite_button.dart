import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_text_button.dart';
import 'package:shoppe/features/settings/logic/settings_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class PhoneEditeButton extends StatelessWidget {

  const PhoneEditeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
        shadowColor: ColorsManager.mainBlue,
        verticalSize: 55,
        horizontalSize: 110,
        onPressed: () {
          putEmailAndName(context);
        },
        text: AppLocalizations.of(context)!.save,
        textStyle: TextStyles.font22WhiteBold);
  }

  void putEmailAndName(BuildContext context) {
    if (context.read<SettingsCubit>().phoneFormKey.currentState!.validate()) {
      context.read<SettingsCubit>().emitUpdateProfileData();
    }
  }
}
