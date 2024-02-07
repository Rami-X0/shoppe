
import 'package:json_annotation/json_annotation.dart';
part'signup_request.g.dart';
@JsonSerializable()
class SignUpRequest {
  final String email;
  final String name;
  final String phone;
  final String password;

  SignUpRequest({
    required this.email,
    required this.name,
    required this.phone,
    required this.password,
  });
  factory SignUpRequest.fromJson(Map<String, dynamic> json) => _$SignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
