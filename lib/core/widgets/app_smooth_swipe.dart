import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/colors.dart';

class AppSmoothSwipe extends StatelessWidget {
  final int itemLength;
  final int activePage;

  const AppSmoothSwipe({
    super.key,
    required this.itemLength,
    required this.activePage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemLength,
          itemBuilder: (context, index) {
            return _smoothSwipeItem(index: index);
          }),
    );
  }

  Widget _smoothSwipeItem({
    required int index,
  }) {
    return AnimatedContainer(
      width: activePage == index ? 24.w : 15.w,
      height: activePage == index ? 24.w : 12.w,
      duration: const Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      decoration: BoxDecoration(
        border: Border.all(
            color: activePage == index ? ColorsManager.mainBlue : ColorsManager
                .mainBlue.withOpacity(0.5),
            width:activePage == index ? 1.5:1
        ),

        shape: BoxShape.circle,
      ),

      child: FractionallySizedBox(
        heightFactor: 0.9,
        child: AnimatedContainer(
          width: activePage == index ? 22.w : 12.w,
          height: activePage == index ? 22.w : 12.w,
          duration: const Duration(milliseconds: 350),
          margin: EdgeInsets.symmetric(horizontal: 1.w),
          decoration: BoxDecoration(
            color: activePage == index
                ? ColorsManager.mainBlue
                : ColorsManager.mainBlue.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
