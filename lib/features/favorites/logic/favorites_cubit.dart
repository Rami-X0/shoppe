import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/features/favorites/data/favorites_repo/favorites_repo.dart';
import 'package:shoppe/features/favorites/data/models/favorites_request.dart';
import 'package:shoppe/features/favorites/logic/favorites_state.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepo _favoritesRepo;
  final HomeCubit _homeCubit;

  FavoritesCubit(this._favoritesRepo, this._homeCubit)
      : super(const FavoritesState.initial());

  void emitFavorites() async {
    emit(const FavoritesState.loadingGetFavorites());
    final response = await _favoritesRepo.favorites();
    response.whenOrNull(success: (favoritesResponse) {
      emit(FavoritesState.successGetFavorites(favoritesResponse));
    });
  }

  void emitAddFavorites(FavoritesRequest id) async {
    emit(const FavoritesState.loadingAddFavorites());
    _homeCubit.favorites[id.productId] = !_homeCubit.favorites[id.productId]!;
    final response = await _favoritesRepo.addFavorites(id);
    response.whenOrNull(success: (favoritesAddResponse) {
      if (!favoritesAddResponse.status!) {
        _homeCubit.favorites[id.productId] =
            !_homeCubit.favorites[id.productId]!;
      }
      emitFavorites();
      emit(FavoritesState.successAddFavorites(favoritesAddResponse));
    });
  }

  void addProductFavorites(BuildContext context, ProductData productData) {
    context.read<FavoritesCubit>().emitAddFavorites(
          FavoritesRequest(
            productId: productData.id!,
          ),
        );
  }
}
