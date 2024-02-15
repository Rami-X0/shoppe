import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AppLoading extends StatelessWidget {
  final double? height;
  final double? width;

  const AppLoading({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(
      'assets/lottie/loading.json',
      width: width ?? 150.w,
      height: height ?? 150.h,
    ));
  }
}
