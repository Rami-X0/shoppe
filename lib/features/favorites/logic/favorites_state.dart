import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoppe/features/favorites/data/models/favorites_response.dart';
part'favorites_state.freezed.dart';
@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = _Initial;

  const factory FavoritesState.loadingGetFavorites() = LoadingGetFavorites;

  const factory FavoritesState.successGetFavorites(FavoritesResponse data) = SuccessGetFavorites;

}
