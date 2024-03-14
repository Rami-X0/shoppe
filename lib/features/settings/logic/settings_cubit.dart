import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/features/settings/data/models/profile_update_request.dart';
import 'package:shoppe/features/settings/data/settings_repo/settings_repo.dart';
import 'package:shoppe/features/settings/logic/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepo _settingsRepo;
  final GlobalKey<FormState> nameAndEmailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  SettingsCubit(this._settingsRepo) : super(const SettingsState.initial());

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
          phone: phoneController.text),
    );
    response.whenOrNull(success: (profileResponse) {
      emit(SettingsState.successPutData(profileResponse));
      emitProfile();
    });
  }


}
