import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:shoppe/core/caching/app_shared_pref_key.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'core/routing/app_router.dart' as route;

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

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:
        token == null
            ? (onBoarding == null
                ? Routes.onBoardingScreen
                : Routes.loginScreen)
            : Routes.homeScreen,
        // Routes.favoritesScreen,
        onGenerateRoute: route.generateRoute,

        themeMode: ThemeMode.dark,
        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: ColorsManager.mainBlue,
            selectionColor: ColorsManager.mainBlue,
            selectionHandleColor: ColorsManager.mainBlue,
          ),
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
      ),
    );
  }
}
