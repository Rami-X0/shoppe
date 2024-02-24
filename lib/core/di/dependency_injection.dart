import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shoppe/core/networking/dio_factory.dart';
import 'package:shoppe/core/networking/api_services.dart';
import 'package:shoppe/features/favorites/data/favorites_repo/favorites_repo.dart';
import 'package:shoppe/features/favorites/logic/favorites_cubit.dart';
import 'package:shoppe/features/home/data/home_repo/home_repo.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:shoppe/features/login/data/repo/login_repo.dart';
import 'package:shoppe/features/login/logic/cubit/login_cubit.dart';
import 'package:shoppe/features/sign_up/data/repo/signup_repo.dart';
import 'package:shoppe/features/sign_up/logic/cubit/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  Dio dio = await DioFactory.getDio();
  //login
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));
// signUp
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
// home
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
// favorites
  getIt.registerFactory<FavoritesCubit>(() => FavoritesCubit(getIt(), getIt()));
  getIt.registerLazySingleton<FavoritesRepo>(() => FavoritesRepo(getIt()));
}
