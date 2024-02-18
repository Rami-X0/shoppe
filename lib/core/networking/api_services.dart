import 'package:dio/dio.dart';
import 'package:shoppe/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shoppe/features/home/data/models/banners_response.dart';
import 'package:shoppe/features/home/data/models/categories_response.dart';
import 'package:shoppe/features/login/data/models/login_request_body.dart';
import 'package:shoppe/features/login/data/models/login_response.dart';
import 'package:shoppe/features/sign_up/data/models/signup_request.dart';
import 'package:shoppe/features/sign_up/data/models/signup_response.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST(ApiConstants.signUp)
  Future<SignUpResponse> signUp(@Body() SignUpRequest signUpRequest);

  @GET(ApiConstants.banners)
  Future<BannersResponse> banners();

  @GET(ApiConstants.categories)
  Future<CategoriesResponse> categories();
}
