import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/caching/app_shared_pref_key.dart';
import 'package:shoppe/core/di/dependency_injection.dart';
import 'package:shoppe/core/caching/app_shared_pref.dart';
import 'package:shoppe/core/helper/bloc_observer.dart';
import 'package:shoppe/shoppe_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  await AppSharedPref.initSharedPref();
  token = await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.tokenKey);
  onBoarding =
      await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.onBoarding);
  Bloc.observer = MyBlocObserver();

  runApp(const ShoppeApp());
}
