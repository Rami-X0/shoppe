import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/di/dependency_injection.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/features/login/logic/cubit/login_cubit.dart';
import 'package:shoppe/features/login/ui/login_screen.dart';
import 'package:shoppe/features/onboarding/ui/onboarding_screen.dart';

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.onBoardingScreen:
      return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
    case Routes.loginScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen()),
      );
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
