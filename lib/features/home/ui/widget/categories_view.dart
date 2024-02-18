import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widgets/app_loading.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:shoppe/features/home/logic/home_state.dart';
import 'package:shoppe/features/home/ui/widget/categories_view_item.dart';
import 'package:shoppe/features/home/ui/widget/see_more_categories.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).emitCategories();
    return Container(
      height: 190.h,
      width: 355.w,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 5.h,
      ),
      decoration: BoxDecoration(
        color: ColorsManager.mainBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const SeeMoreCategories(),
          verticalSpace(4),
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                current is LoadingGetCategories ||
                current is SuccessGetCategories,
            builder: (context, state) {
              return state.maybeWhen(
                loadingGetCategories: () {
                  return const AppLoading();
                },
                successGetCategories: (categoriesResponse) {
                  return SizedBox(
                    height: 110,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          categoriesResponse.data!.categoriesData!.length,
                      itemBuilder: (context, index) {
                        return CategoriesViewItem(
                          categoriesResponse: categoriesResponse,
                          index: index,
                        );
                      },
                    ),
                  );
                },
                orElse: () {
                  return const SizedBox.shrink();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
