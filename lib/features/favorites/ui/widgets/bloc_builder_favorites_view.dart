import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/widgets/app_loading.dart';
import 'package:shoppe/features/favorites/logic/favorites_cubit.dart';
import 'package:shoppe/features/favorites/logic/favorites_state.dart';
import 'package:shoppe/features/favorites/ui/widgets/favorites_view.dart';

class BlocBuilderFavoritesView extends StatelessWidget {
  const BlocBuilderFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      buildWhen: (previous, current) =>
          current is SuccessGetFavorites,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const SizedBox.shrink();
          },
          loadingGetFavorites: () {
            return const AppLoading();
          },
          successGetFavorites: (favoritesResponse) {
            return FavoritesView(
              favoritesResponse: favoritesResponse,
            );
          },
        );
      },
    );
  }
}
