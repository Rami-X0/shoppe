import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/colors.dart';

class DefaultContainerHome extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;

  const DefaultContainerHome({
    super.key,
    required this.child,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.h,
      width: width?.w,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 3.h,
      ),
      decoration: BoxDecoration(
        color: ColorsManager.mainBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
            ),
      child: child,
    );
  }
}
