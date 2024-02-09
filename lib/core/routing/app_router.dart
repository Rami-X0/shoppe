import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/di/dependency_injection.dart';
import 'package:shoppe/core/routing/animation_router/app_size_transition_router.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/features/home/ui/home_screen.dart';
import 'package:shoppe/features/login/logic/cubit/login_cubit.dart';
import 'package:shoppe/features/login/ui/login_screen.dart';
import 'package:shoppe/features/onboarding/ui/onboarding_screen.dart';
import 'package:shoppe/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:shoppe/features/sign_up/ui/sign_up_screen.dart';

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.onBoardingScreen:
      return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
    case Routes.loginScreen:
      return AppSizeTransitionRouter(
        BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen()),
      );
    case Routes.signUpScreen:
      return AppSizeTransitionRouter(BlocProvider(
          create: (context) => getIt<SignUpCubit>(),
          child: const SignUpScreen()));
    case Routes.homeScreen:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
