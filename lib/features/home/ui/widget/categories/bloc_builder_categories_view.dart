import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/widgets/app_loading.dart';
import 'package:shoppe/core/widgets/app_slide_scale_fade_transition.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:shoppe/features/home/logic/home_state.dart';
import 'package:shoppe/features/home/ui/widget/categories/categories_view.dart';
import 'package:shoppe/features/home/ui/widget/categories/see_more_categories.dart';
import 'package:shoppe/features/home/ui/widget/default_container_home.dart';

class BlocBuilderCategoriesView extends StatefulWidget {
  const BlocBuilderCategoriesView({super.key});

  @override
  State<BlocBuilderCategoriesView> createState() => _BlocBuilderCategoriesViewState();
}

class _BlocBuilderCategoriesViewState extends State<BlocBuilderCategoriesView> with
AutomaticKeepAliveClientMixin
{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                    return const AppLoading();
                  },
                  successGetCategories: (categoriesResponse) {
                    return SizedBox(
                      height: 110,
                      child: CategoriesView(
                        categoriesResponse: categoriesResponse,
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
      ),
    );
  }
}
