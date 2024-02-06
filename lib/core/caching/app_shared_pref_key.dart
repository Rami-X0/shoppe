import 'package:shoppe/core/caching/app_shared_pref.dart';

class AppSharedPrefKey {
  static String tokenKey = 'token';
  static String onBoarding = 'onBoarding';
}

var token = AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.tokenKey);
var onBoarding = AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.onBoarding);
