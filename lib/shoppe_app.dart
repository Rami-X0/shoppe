import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:shoppe/core/caching/app_shared_pref_key.dart';
import 'package:shoppe/core/di/dependency_injection.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/features/settings/logic/settings_cubit.dart';
import 'package:shoppe/features/settings/logic/settings_state.dart';
import 'core/routing/app_router.dart' as route;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShoppeApp extends StatefulWidget {
  const ShoppeApp({
    super.key,
  });

  @override
  State<ShoppeApp> createState() => _ShoppeAppState();
}

class _ShoppeAppState extends State<ShoppeApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return BlocProvider<SettingsCubit>.value(
      value: getIt<SettingsCubit>(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: token == null
                  ? (onBoarding == null
                      ? Routes.onBoardingScreen
                      : Routes.loginScreen)
                  : Routes.homeScreen,
              onGenerateRoute: route.generateRoute,
              theme: ThemeData(
                textSelectionTheme: TextSelectionThemeData(
                  cursorColor: ColorsManager.mainBlue.withOpacity(0.4),
                  selectionColor: ColorsManager.mainBlue.withOpacity(0.4),
                  selectionHandleColor: ColorsManager.mainBlue.withOpacity(0.4),
                ),
                scaffoldBackgroundColor: Colors.white,
              ),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale(
                appLanguage ?? 'en',
              ),
            ),
          );
        },
      ),
    );
  }
}
