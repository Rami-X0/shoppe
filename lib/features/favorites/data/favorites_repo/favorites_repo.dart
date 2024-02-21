import 'package:shoppe/core/caching/app_shared_pref_key.dart';
import 'package:shoppe/core/networking/api_result.dart';
import 'package:shoppe/core/networking/api_services.dart';
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
}
