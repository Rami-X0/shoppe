import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_loading.dart';
import 'package:shoppe/features/search/logic/search_cubit.dart';
import 'package:shoppe/features/search/logic/search_state.dart';
import 'package:shoppe/features/search/ui/widgets/search_view.dart';

class BlocBuilderSearchView extends StatelessWidget {
  const BlocBuilderSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return const SizedBox.shrink();
          },
          loadingSearch: () {
            return const AppLoading();
          },
          successSearch: (searchData) {
            if (searchData.data!.productData!.isEmpty) {
              return Text(
                'This product does not exist.',
                style: TextStyles.font18MainBlueSemiBold,
              );
            }
            return SearchView(
              productsResponse: searchData,
            );
          },
        );
      },
    );
  }
}
