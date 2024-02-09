import 'package:shoppe/core/networking/api_result.dart';
import 'package:shoppe/core/networking/api_services.dart';
import 'package:shoppe/features/sign_up/data/models/signup_request.dart';
import 'package:shoppe/features/sign_up/data/models/signup_response.dart';

class SignUpRepo {
  final ApiServices _apiServices;

  SignUpRepo(this._apiServices);

  Future<ApiResult<SignUpResponse>> signUp(SignUpRequest signUpRequest) async {
    try {
      final response = await _apiServices.signUp(signUpRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
