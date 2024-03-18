import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/widgets/app_loading.dart';
import 'package:shoppe/core/widgets/app_slide_scale_fade_transition.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:shoppe/features/home/logic/home_state.dart';
import 'package:shoppe/features/home/ui/widget/categories/categories_view.dart';
import 'package:shoppe/features/home/ui/widget/categories/see_more_categories.dart';
import 'package:shoppe/features/home/ui/widget/default_container_home.dart';

class BlocBuilderCategoriesView extends StatelessWidget {
  const BlocBuilderCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).emitCategories();

    return AppSlideScaleFadeTransition(
      scaleOffsetEnd: 6,
      child: DefaultContainerHome(
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
                    return SizedBox(height: 140.h, child: const AppLoading());
                  },
                  successGetCategories: (categoriesResponse) {
                    return CategoriesView(
                      categoriesResponse: categoriesResponse,
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
      ),
    );
  }
}
