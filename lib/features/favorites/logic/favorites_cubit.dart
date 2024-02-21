import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/caching/app_shared_pref_key.dart';
import 'package:shoppe/features/favorites/data/favorites_repo/favorites_repo.dart';
import 'package:shoppe/features/favorites/logic/favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepo _favoritesRepo;

  FavoritesCubit(this._favoritesRepo) : super(const FavoritesState.initial());

  void emitFavorites() async {
    emit(const FavoritesState.loadingGetFavorites());
    final response = await _favoritesRepo.favorites();
    response.whenOrNull(success: (favoritesResponse) {
      emit(FavoritesState.successGetFavorites(favoritesResponse));
    });
  }
}
