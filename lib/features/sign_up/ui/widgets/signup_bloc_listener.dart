import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/helper/extension.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/core/widgets/app_loading.dart';
import 'package:shoppe/core/widgets/app_show_dialog.dart';
import 'package:shoppe/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:shoppe/features/sign_up/logic/cubit/signup_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
      current is Loading || current is Success,
      listener: (context, state) {
        state.whenOrNull(loading: () {
         return showDialog(
              context: context,
              builder: (context) {
                return
                  const AppLoading();
              });
        }, success: (signupResponse) {
          if (signupResponse.status == true) {
            context.pop();

            context.pushNamed(Routes.loginScreen);
          } else {
            context.pop();
            return showDialog(
                context: context,
                builder: (context) {
                  return AppShowDialog(
                    text: signupResponse.message,
                  );
                });
         // debugPrint('0000000000=====>');
          }
        });
      },
      child: const SizedBox.shrink(),
    );
  }
}
