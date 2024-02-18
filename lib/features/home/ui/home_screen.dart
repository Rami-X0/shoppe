import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/widgets/app_slide_scale_fade_transition.dart';
import 'package:shoppe/features/home/ui/widget/banners_view.dart';
import 'package:shoppe/features/home/ui/widget/categories_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 10.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppSlideScaleFadeTransition(
                  scaleOffsetEnd: 1,
                  child: BannersPageView(),
                ),
                verticalSpace(10),
                const AppSlideScaleFadeTransition(
                  scaleOffsetEnd: 2.5,
                  child: CategoriesGridView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
