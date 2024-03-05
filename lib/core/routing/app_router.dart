import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/di/dependency_injection.dart';
import 'package:shoppe/core/routing/animation_routing/app_size_transition_router.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/features/favorites/logic/favorites_cubit.dart';
import 'package:shoppe/features/favorites/ui/favorites_screen.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
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
      return AppSizeTransitionRouter(
        BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen()),
      );
    case Routes.homeScreen:
      return AppSizeTransitionRouter(
        _routesMultiBlocProvider(
          child: const HomeScreen(),
        ),
      );

    case Routes.favoritesScreen:
      return MaterialPageRoute(
        builder: (_) => _routesMultiBlocProvider(
          child: const FavoritesScreen(),
        ),
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

Widget _routesMultiBlocProvider({
  required Widget child,
}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<HomeCubit>.value(
        value: getIt<HomeCubit>(),
      ),
      BlocProvider<FavoritesCubit>.value(
        value: getIt<FavoritesCubit>()..emitFavorites(),
      )
    ],
    child: child,
  );
}