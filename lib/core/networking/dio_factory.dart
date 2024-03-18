import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shoppe/core/caching/app_shared_pref.dart';
import 'package:shoppe/core/caching/app_shared_pref_key.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    await AppSharedPref.initSharedPref();
    token = await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.token);
    appLanguage =
        await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.appLanguage);

    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();

      dio!.options.headers = {
        'Content-Type': 'application/json',
        'lang':appLanguage.toString(),
        'Authorization': token.toString() ,
      };
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      // addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

static void addDioInterceptor() async {
  dio?.interceptors.add(
    PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ),
  );
}
}
