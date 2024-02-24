// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_add_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesAddResponse _$FavoritesAddResponseFromJson(
        Map<String, dynamic> json) =>
    FavoritesAddResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$FavoritesAddResponseToJson(
        FavoritesAddResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
