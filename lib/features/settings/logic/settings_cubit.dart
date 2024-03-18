import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/caching/app_shared_pref.dart';
import 'package:shoppe/core/caching/app_shared_pref_key.dart';
import 'package:shoppe/core/networking/dio_factory.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:shoppe/features/settings/data/models/profile_update_request.dart';
import 'package:shoppe/features/settings/data/settings_repo/settings_repo.dart';
import 'package:shoppe/features/settings/logic/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final HomeCubit _homeCubit;
  final SettingsRepo _settingsRepo;
  final GlobalKey<FormState> nameAndEmailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String arabicLanguageCode = 'ar';
  String defaultLanguageCode = 'en';
  String englishLanguageCode = 'en';
  String dioHeaderLang = 'lang';

  SettingsCubit(this._settingsRepo, this._homeCubit)
      : super(const SettingsState.initial());

  void emitProfile() async {
    emit(const SettingsState.loadingGetProfile());
    final response = await _settingsRepo.profile();
    response.whenOrNull(success: (profileResponse) {
      emit(SettingsState.successGetProfile(profileResponse));
    });
  }

  Future<void> emitUpdateProfileData() async {
    emit(const SettingsState.loadingPutData());
    final response = await _settingsRepo.updateProfile(
      ProfileUpdateRequest(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
      ),
    );
    response.whenOrNull(success: (profileResponse) {
      emit(SettingsState.successPutData(profileResponse));
      emitProfile();
    });
  }

  void emitAppLanguage(String isSwitch) async {
    if (isSwitch == englishLanguageCode) {
      defaultLanguageCode = englishLanguageCode;
    } else {
      defaultLanguageCode = arabicLanguageCode;
    }
    AppSharedPref.sharedPrefSet(
        key: AppSharedPrefKey.appLanguage,
        value: defaultLanguageCode.toString());
    appLanguage =
        await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.appLanguage);
    DioFactory.dio!.options.headers[dioHeaderLang] = appLanguage.toString();
    _homeCubit.emitProducts();
    _homeCubit.emitCategories();
    emitProfile();
    emit( SettingsState.successSwitchLanguage(language: appLanguage.toString()));
  }
}
