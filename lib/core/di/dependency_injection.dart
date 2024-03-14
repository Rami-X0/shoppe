import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shoppe/core/networking/dio_factory.dart';
import 'package:shoppe/core/networking/api_services.dart';
import 'package:shoppe/features/carts/data/carts_repo/carts_repo.dart';
import 'package:shoppe/features/carts/logic/carts_cubit.dart';
import 'package:shoppe/features/favorites/data/favorites_repo/favorites_repo.dart';
import 'package:shoppe/features/favorites/logic/favorites_cubit.dart';
import 'package:shoppe/features/home/data/home_repo/home_repo.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:shoppe/features/login/data/repo/login_repo.dart';
import 'package:shoppe/features/login/logic/cubit/login_cubit.dart';
import 'package:shoppe/features/search/data/search_repo/search_repo.dart';
import 'package:shoppe/features/search/logic/search_cubit.dart';
import 'package:shoppe/features/settings/data/settings_repo/settings_repo.dart';
import 'package:shoppe/features/settings/logic/settings_cubit.dart';
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
  getIt.registerLazySingleton<FavoritesCubit>(
      () => FavoritesCubit(getIt(), getIt()));
  getIt.registerLazySingleton<FavoritesRepo>(() => FavoritesRepo(getIt()));
// carts
  getIt.registerLazySingleton<CartsCubit>(() => CartsCubit(getIt(), getIt()));
  getIt.registerLazySingleton<CartsRepo>(() => CartsRepo(getIt()));
// search
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));
  getIt.registerLazySingleton<SearchRepo>(() => SearchRepo(getIt()));
// settings
  getIt.registerLazySingleton<SettingsCubit>(() => SettingsCubit(getIt()));
  getIt.registerLazySingleton<SettingsRepo>(() => SettingsRepo(getIt()));

}
