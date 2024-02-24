import 'package:shoppe/core/networking/api_result.dart';
import 'package:shoppe/core/networking/api_services.dart';
import 'package:shoppe/features/favorites/data/models/favorites_add_response.dart';
import 'package:shoppe/features/favorites/data/models/favorites_request.dart';
import 'package:shoppe/features/favorites/data/models/favorites_response.dart';

class FavoritesRepo {
  final ApiServices _apiServices;

  FavoritesRepo(this._apiServices);

  Future<ApiResult<FavoritesResponse>> favorites() async {
    try {
      final response = await _apiServices.favorites();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<FavoritesAddResponse>> addFavorites(FavoritesRequest id) async {
    try {
      final response = await _apiServices.addFavorites(id);
    return  ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
  Future<ApiResult<FavoritesAddResponse>> removeFavorites(FavoritesRequest id) async {
    try {
      final response = await _apiServices.addFavorites(id);
    return  ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
