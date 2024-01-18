import 'package:flutter_screenutil/flutter_screenutil.dart';
import'package:flutter/material.dart';
import 'package:shoppe/features/onboarding/ui/onboarding_screen.dart';
class ShoppeApp extends StatelessWidget {
  const ShoppeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoardingScreen(),
      ),
    );
  }
}
