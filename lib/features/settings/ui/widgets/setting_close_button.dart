import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widgets/app_loading.dart';
import 'package:shoppe/features/settings/logic/settings_cubit.dart';
import 'package:shoppe/features/settings/logic/settings_state.dart';

class SettingsCloseButton extends StatelessWidget {
  const SettingsCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        if (state is LoadingPutData) {
          return SizedBox(height: 75.h, child: const AppLoading());
        } else {
          return SizedBox(
            height: 75.h,
            child: CircleAvatar(
              maxRadius: 22.w,
              backgroundColor: ColorsManager.mainBlue.withOpacity(0.3),
              child: CloseButton(
                color: ColorsManager.mainBlue,
                style: ButtonStyle(
                  iconSize: MaterialStateProperty.all(25.w),
                ),
              ),
            ),
          );
        }
      },
    );
  }



}
