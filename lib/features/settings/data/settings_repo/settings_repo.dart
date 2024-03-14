import 'package:shoppe/core/networking/api_result.dart';
import 'package:shoppe/core/networking/api_services.dart';
import 'package:shoppe/features/settings/data/models/profile_response.dart';
import 'package:shoppe/features/settings/data/models/profile_update_request.dart';

class SettingsRepo {
  final ApiServices _apiServices;

  SettingsRepo(this._apiServices);

  Future<ApiResult<ProfileResponse>> profile() async {
    try {
      final response = await _apiServices.profile();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
  Future<ApiResult<ProfileResponse>> updateProfile(ProfileUpdateRequest profileUpdateRequest) async {
    try {
      final response = await _apiServices.updateProfile(profileUpdateRequest);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
