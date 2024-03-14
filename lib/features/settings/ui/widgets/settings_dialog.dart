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

  const SettingsDialog({super.key, required this.child, required this.height});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsCubit>.value(
      value: getIt<SettingsCubit>(),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AppSlideScaleFadeTransition(
          scaleOffsetEnd: 1,
          duration: 600,
          child: Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
            clipBehavior: Clip.antiAliasWithSaveLayer,
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
