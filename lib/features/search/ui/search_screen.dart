import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shoppe/core/di/dependency_injection.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/features/search/logic/search_cubit.dart';
import 'package:shoppe/features/search/ui/widgets/bloc_buildr_search_view.dart';
import 'package:shoppe/features/search/ui/widgets/search_button.dart';
import 'package:shoppe/features/search/ui/widgets/search_form.dart';
import 'package:shoppe/features/search/ui/widgets/top_swipe_icon.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  final double radius = 20;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>.value(
      value: getIt<SearchCubit>(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        height: 650.h,
        decoration: BoxDecoration(
          color: ColorsManager.skyBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius),
          ),
        ),
        child: Column(
          children: [
            const TopSwipeIcon(),
            Gap(10.h),
            Row(
              children: [
                const SearchForm(),
                Gap(17.w),
                const SearchButton(),
              ],
            ),
            Gap(10.h),
            const BlocBuilderSearchView(),
          ],
        ),
      ),
    );
  }
}
