import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'core/routing/app_router.dart' as route;

class ShoppeApp extends StatelessWidget {
  const ShoppeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: route.generateRoute,
        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: ColorsManager.mainBlue,
            selectionColor: ColorsManager.mainBlue,
            selectionHandleColor: ColorsManager.mainBlue,
          ),
        ),
      ),
    );
  }
}
