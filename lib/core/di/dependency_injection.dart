import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shoppe/core/dio_factory.dart';
import 'package:shoppe/core/networking/api_services.dart';
import 'package:shoppe/features/login/data/repo/login_repo.dart';
import 'package:shoppe/features/login/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;

  Future<void> initGetIt() async{
Dio dio=await DioFactory.getDio();
  //login
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));
}
