import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widgets/app_text_form_field.dart';
import 'package:shoppe/features/login/logic/cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

bool _showPassword = true;

class _EmailAndPasswordState extends State<EmailAndPassword> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
            hintText: 'Email',
            suffixIcon: _paddingSuffixIcon(
              const FaIcon(
                FontAwesomeIcons.solidEnvelope,
                // size: 25,
                color: ColorsManager.mainBlue,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                'Please enter tour email right';
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            obscureText: _showPassword,
            hintText: 'Password',
            suffixIcon: _paddingSuffixIcon(
              GestureDetector(
                onTap: () {
                  _showPassword = !_showPassword;
                  setState(() {});
                },
                child: FaIcon(
                  _showPassword
                      ? FontAwesomeIcons.eyeSlash
                      : FontAwesomeIcons.eye,
                  // size: 25,
                  color: ColorsManager.mainBlue,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                'Please enter tour password right';
              }
            },
          ),
          verticalSpace(52),
        ],
      ),
    );
  }

  Widget _paddingSuffixIcon(Widget child) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 19.h,
        horizontal: 20.w,
      ),
      child: child,
    );
  }
}
