import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final bool? status;
  final String? message;
  @JsonKey(name: 'data')
  final UserData? userData;

  LoginResponse({
    this.status,
    this.message,
    this.userData,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? token;

  UserData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
