import 'package:shoppe/core/caching/app_shared_pref.dart';

class AppSharedPrefKey {
  static String token = 'token';
  static String onBoarding = 'onBoarding';
  static String appLanguage = 'appLanguage';
}


var token = AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.token);
var onBoarding = AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.onBoarding);
var appLanguage = AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.appLanguage);
