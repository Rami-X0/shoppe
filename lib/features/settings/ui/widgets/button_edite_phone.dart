import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_text_button.dart';
import 'package:shoppe/features/settings/logic/settings_cubit.dart';

class ButtonEditePhone extends StatelessWidget {

  const ButtonEditePhone({
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
        text: 'Done',
        textStyle: TextStyles.font22WhiteBold);
  }

  void putEmailAndName(BuildContext context) {
    if (context.read<SettingsCubit>().phoneKey.currentState!.validate()) {
      context.read<SettingsCubit>().emitUpdateProfileData();
    }
  }
}
