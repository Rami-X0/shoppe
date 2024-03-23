import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/helper/extension.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/core/widgets/app_loading.dart';
import 'package:shoppe/core/widgets/app_error_show_dialog.dart';
import 'package:shoppe/core/widgets/app_snack_bar.dart';
import 'package:shoppe/features/login/logic/cubit/login_cubit.dart';
import 'package:shoppe/features/login/logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            return showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: const AppLoading(),
                );
              },
            );
          },
          success: (loginResponse) {
            if (loginResponse.status == true) {
              context.pushNamed(Routes.homeScreen);
              appSnackBar(
                text: loginResponse.message.toString(),
                backGroundColor:
                    loginResponse.status == true ? Colors.green : Colors.red,
                context: context,
              );
            } else {
              Navigator.pop(context);
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AppErrorShowDialog(
                    text: loginResponse.message.toString(),
                  );
                },
              );
            }
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
