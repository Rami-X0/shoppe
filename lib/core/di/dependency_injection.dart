import 'package:get_it/get_it.dart';
import 'package:shoppe/features/login/logic/cubit/login_cubit.dart';
final getIt=GetIt.instance;
void initGetIt(){
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit());
}