// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    SignUpRequest(
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'password': instance.password,
    };
