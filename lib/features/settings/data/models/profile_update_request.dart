import 'package:json_annotation/json_annotation.dart';

part 'profile_update_request.g.dart';

@JsonSerializable()
class ProfileUpdateRequest  {
  final String? name;
  final String? phone;
  final String? email;
  final String? password;

  ProfileUpdateRequest({
    this.name,
    this.phone,
    this.email,
    this.password,
  });

  factory ProfileUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileUpdateRequestToJson(this);
}
