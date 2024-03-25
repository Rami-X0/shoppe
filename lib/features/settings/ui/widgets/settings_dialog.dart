import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/di/dependency_injection.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widgets/app_slide_scale_fade_transition.dart';
import 'package:shoppe/features/settings/logic/settings_cubit.dart';

class SettingsDialog extends StatelessWidget {
  final Widget child;
  final double height;

  const SettingsDialog({
    super.key,
    required this.child,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsCubit>.value(
      value: getIt<SettingsCubit>(),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: AppSlideScaleFadeTransition(
          scaleOffsetEnd: 0.8,
          duration: 350,
          child: Dialog(
            elevation: 0,
            shadowColor:  Colors.transparent,
            surfaceTintColor:Colors.transparent ,
            backgroundColor: Colors.transparent,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            insetPadding: EdgeInsets.symmetric(horizontal: 5.w, ),
            child: Container(
              color: ColorsManager.skyBlue,
              height: height.h,
              width: double.maxFinite,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
