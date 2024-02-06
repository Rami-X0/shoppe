import 'package:shoppe/core/networking/api_result.dart';
import 'package:shoppe/core/networking/api_services.dart';
import 'package:shoppe/features/login/data/models/login_request_body.dart';
import 'package:shoppe/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiServices _apiServices;

  LoginRepo(this._apiServices);

  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequest) async {
    try {
      final response = await _apiServices.login(loginRequest);
      return ApiResult.success(response);
    } catch  (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
