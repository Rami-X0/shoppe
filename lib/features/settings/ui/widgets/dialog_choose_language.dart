import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/di/dependency_injection.dart';
import 'package:shoppe/core/helper/extension.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:shoppe/features/home/logic/home_state.dart';
import 'package:shoppe/features/settings/ui/widgets/settings_text_loading.dart';

class DialogChooseLanguage extends StatelessWidget {
  const DialogChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>.value(
      value: getIt<HomeCubit>(),
      child: BlocConsumer<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is LoadingGetProducts,
        listenWhen: (previous, current) => current is SuccessGetProducts,
        builder: (context, state) => dialogChangeLanguage(),
        listener: (context, state) {
          context.pushNamedAndRemoveUntil(
            Routes.homeScreen,
          );
        },
      ),
    );
  }

  BackdropFilter dialogChangeLanguage() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        insetPadding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 0),
        child: SettingsTextLoading(
          textStyle: TextStyles.font40MainLightGrey,
          backgroundColor: Colors.black.withOpacity(0.5),
        ),
      ),
    );
  }
}
