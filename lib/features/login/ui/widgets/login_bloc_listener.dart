import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/caching/app_shared_pref.dart';
import 'package:shoppe/core/caching/app_shared_pref_key.dart';
import 'package:shoppe/core/helper/extension.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_text_button.dart';
import 'package:shoppe/features/login/data/models/login_response.dart';
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
                context: context,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                });
          },
          success: (loginResponse) {
            if (loginResponse.status == true) {
              context.pop();
              Navigator.pop(context);

              context.pushNamed(Routes.homeScreen);
              AppSharedPref.sharedPrefSet(
                key: AppSharedPrefKey.tokenKey,
                value: loginResponse.userData!.token,
              );
            } else {
              Navigator.pop(context);

              showDialog(
                context: context,
                builder: (context) {
                  return _showDialogError(loginResponse, context);
                },
              );
            }
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  Dialog _showDialogError(LoginResponse loginResponse, BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: SizedBox(
        height: 355.h,
        width: 250.w,
        child: Stack(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                width: 300.w,
                height: 250.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    verticalSpace(70),
                    Text(
                      loginResponse.message.toString(),
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
                      backGroundColor: Colors.red,
                      horizontalSize: 200,
                      verticalSize: 55,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Material(
                color: Colors.transparent,
                shape: const CircleBorder(side: BorderSide.none),
                elevation: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 40,
                  child: CircleAvatar(
                    maxRadius: 25,
                    backgroundColor: Colors.pink.withOpacity(0.2),
                    child: const FaIcon(
                      FontAwesomeIcons.circleExclamation,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
