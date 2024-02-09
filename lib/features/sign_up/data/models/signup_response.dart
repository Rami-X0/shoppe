import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  final bool? status;
  final String? message;
  @JsonKey(name: 'data')
  final UserData? userData;

  SignUpResponse({
    this.status,
    this.message,
    this.userData,
  });
  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}

@JsonSerializable()
class UserData {
  final String? email;
  final String? name;
  final String? phone;
  final String? password;

  UserData({
    this.email,
    this.name,
    this.phone,
    this.password,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
