import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoppe/features/settings/data/models/profile_response.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = Initila;

  const factory SettingsState.loadingGetProfile() = LoadingGetProfile;

  const factory SettingsState.successGetProfile(
      ProfileResponse profileResponse) = SuccessGetProfile;

  const factory SettingsState.loadingPutData() = LoadingPutData;

  const factory SettingsState.successPutData(ProfileResponse profileResponse) =
      SuccessPutData;

  const factory SettingsState.successSwitchLanguage({required String language}) = SuccessSwitchLanguage;

}


