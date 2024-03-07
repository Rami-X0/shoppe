import 'package:dio/dio.dart';
import 'package:shoppe/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shoppe/features/carts/data/models/carts_add_response.dart';
import 'package:shoppe/features/carts/data/models/carts_request.dart';
import 'package:shoppe/features/carts/data/models/carts_response.dart';
import 'package:shoppe/features/favorites/data/models/favorites_add_response.dart';
import 'package:shoppe/features/favorites/data/models/favorites_request.dart';
import 'package:shoppe/features/favorites/data/models/favorites_response.dart';
import 'package:shoppe/features/home/data/models/banners_response.dart';
import 'package:shoppe/features/home/data/models/categories_response.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';
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

  @GET(ApiConstants.products)
  Future<ProductsResponse> products();

  @GET(ApiConstants.favorites)
  Future<FavoritesResponse> favorites();

  @POST(ApiConstants.favorites)
  Future<FavoritesAddResponse> addFavorites(
      @Body() FavoritesRequest favoritesRequest);

  @POST(ApiConstants.carts)
  Future<CartsAddResponse> addCarts(
      @Body() CartsRequest cartsRequest);

  @GET(ApiConstants.carts)
  Future<CartsResponse> carts();

}
