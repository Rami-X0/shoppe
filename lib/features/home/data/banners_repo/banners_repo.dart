import 'package:shoppe/core/networking/api_result.dart';
import 'package:shoppe/core/networking/api_services.dart';
import 'package:shoppe/features/home/data/models/banners_response.dart';

class BannersRepo {
  final ApiServices _apiServices;

  BannersRepo(this._apiServices);

  Future<ApiResult<BannersResponse>> banners() async {
    try {
      final response = await _apiServices.banners();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
