import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  final bool? status;
  final String? message;
  @JsonKey(name: 'data')
  final ProfileData? userData;

  ProfileResponse({this.status, this.userData, this.message});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}

@JsonSerializable()
class ProfileData {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;

  ProfileData({
    this.id,
    this.name,
    this.email,
    this.phone,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}
