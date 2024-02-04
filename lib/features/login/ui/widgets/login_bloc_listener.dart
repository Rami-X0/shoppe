import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/extension.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_text_button.dart';
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
            debugPrint('=============================> Loading');
            return showDialog(
                context: context,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                });
          },
          success: (loginResponse) {
            debugPrint('=============================> Success');
            if (loginResponse.status == true) {
              context.pop();
              Navigator.pop(context);

              context.pushNamed(Routes.homeScreen);
            } else {
              Navigator.pop(context);

              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Text(
                            loginResponse.message.toString(),
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyles.font13DarkBlueMedium,
                          ),
                          const Spacer(),
                          AppTextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            text: 'Okay',
                            textStyle: TextStyles.font22WhiteBold,
                            backGroundColor: ColorsManager.darkBlue,
                            horizontalSize: 200,
                            verticalSize: 55,
                          ),
                        ],
                      ),
                    ),
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
