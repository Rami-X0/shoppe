import 'package:dio/dio.dart';
import 'package:shoppe/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shoppe/features/login/data/models/login_request_body.dart';
import 'package:shoppe/features/login/data/models/login_response.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequest);
}
