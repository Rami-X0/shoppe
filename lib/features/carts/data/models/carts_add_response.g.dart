// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carts_add_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartsAddResponse _$CartsAddResponseFromJson(Map<String, dynamic> json) =>
    CartsAddResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CartsAddResponseToJson(CartsAddResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
