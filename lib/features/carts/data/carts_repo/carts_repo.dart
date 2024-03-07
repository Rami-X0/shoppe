import 'package:shoppe/core/networking/api_result.dart';
import 'package:shoppe/core/networking/api_services.dart';
import 'package:shoppe/features/carts/data/models/carts_add_response.dart';
import 'package:shoppe/features/carts/data/models/carts_request.dart';
import 'package:shoppe/features/carts/data/models/carts_response.dart';

class CartsRepo {
  final ApiServices _apiServices;

  CartsRepo(this._apiServices);

  Future<ApiResult<CartsAddResponse>> addCarts(
      CartsRequest id) async {
    try {
      final response = await _apiServices.addCarts(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<CartsResponse>> carts()async{
    try {
      final response = await _apiServices.carts();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
