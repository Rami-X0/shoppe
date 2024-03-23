import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/caching/app_shared_pref_key.dart';
import 'package:shoppe/core/widgets/app_loading.dart';
import 'package:shoppe/core/widgets/app_no_data.dart';
import 'package:shoppe/features/favorites/logic/favorites_cubit.dart';
import 'package:shoppe/features/favorites/logic/favorites_state.dart';
import 'package:shoppe/features/favorites/ui/widgets/favorites_view.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:shoppe/features/home/logic/home_state.dart';

class BlocBuilderFavoritesView extends StatelessWidget {
  const BlocBuilderFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FavoritesCubit>(context).emitFavorites();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const AppLoading();
          },
          successGetProducts: (data) {
            return BlocBuilder<FavoritesCubit, FavoritesState>(
              buildWhen: (previous, current) => current is SuccessGetFavorites,
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const SizedBox.shrink();
                  },
                  loadingGetFavorites: () {
                    return const AppLoading();
                  },
                  successGetFavorites: (favoritesResponse) {
                    if (favoritesResponse.favoritesData!.data!.isEmpty) {
                      return const AppNoData();
                    }
                    debugPrint('favorite Token =====${token.toString()}');
                    return FavoritesView(
                      favoritesResponse: favoritesResponse,
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
