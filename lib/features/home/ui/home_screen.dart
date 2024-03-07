import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/widgets/app_slide_scale_fade_transition.dart';
import 'package:shoppe/features/home/ui/widget/banners/bloc_builder_banners_view.dart';
import 'package:shoppe/features/home/ui/widget/categories/bloc_builder_categories_view.dart';
import 'package:shoppe/features/home/ui/widget/drawer_home.dart';
import 'package:shoppe/features/home/ui/widget/products/bloc_builder_products_view.dart';
import 'package:shoppe/features/home/ui/widget/app_bar_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerHome(),
      appBar: const AppBarHome(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 10.w,
          ),
          child: AppSlideScaleFadeTransition(
            scaleOffsetEnd: 2,
            child: ListView(
              children: [
                const BlocBuilderBannersView(),
                const BlocBuilderCategoriesView(),
                verticalSpace(10),
                const BlocBuilderProductsView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
