import 'package:shoppe/core/networking/api_result.dart';
import 'package:shoppe/core/networking/api_services.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';
import 'package:shoppe/features/search/data/models/search_request.dart';

class SearchRepo {
  final ApiServices _apiServices;

  SearchRepo(this._apiServices);

  Future<ApiResult<ProductsResponse>> search(
      SearchRequest searchRequest) async {
    try {
      final response = await _apiServices.search(searchRequest);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
