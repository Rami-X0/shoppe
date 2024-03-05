import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/colors.dart';

class InkWellProductView extends StatelessWidget {
  final Function()? onTap;
  final Widget child;
  final double width;
  final double height;
  final double? circular;
  final Color? borderColor;

  const InkWellProductView({
    super.key,
    required this.onTap,
    required this.child,
    required this.width,
    required this.height,
    this.circular,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(circular ?? 10),
      onTap: onTap,
      highlightColor: ColorsManager.mainBlue.withOpacity(0.2),
      splashColor: ColorsManager.mainBlue.withOpacity(0.2),
      child: Container(
        height: height.h,
        width: width.w,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: ColorsManager.mainBlue.withOpacity(0.1 / 2),
          borderRadius: BorderRadius.circular(circular ?? 5),
          border: Border.all(
              width: 1.5, color:borderColor?? ColorsManager.mainBlue.withOpacity(0.2)),
        ),
        child: Center(child: child),
      ),
    );
  }
}
