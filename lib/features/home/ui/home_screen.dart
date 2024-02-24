import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/widgets/app_slide_scale_fade_transition.dart';
import 'package:shoppe/features/home/ui/widget/bloc_builder_products_view.dart';
import 'package:shoppe/features/home/ui/widget/bottom_home_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 2.h,
              horizontal: 10.w,
            ),
            child: AppSlideScaleFadeTransition(
              scaleOffsetEnd: 2,
              child: ListView(
                children: [
                  // const BlocBuilderBannersView(),
                  // verticalSpace(10),
                  // const BlocBuilderCategoriesView(),
                  // verticalSpace(15),
                  const BlocBuilderProductsView(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const BottomHomeNavigationBar());
  }
}
