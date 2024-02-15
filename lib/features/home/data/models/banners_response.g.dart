// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banners_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannersResponse _$BannersResponseFromJson(Map<String, dynamic> json) =>
    BannersResponse(
      status: json['status'] as bool?,
      bannersData: (json['data'] as List<dynamic>?)
          ?.map((e) => BannersData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BannersResponseToJson(BannersResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.bannersData,
    };

BannersData _$BannersDataFromJson(Map<String, dynamic> json) => BannersData(
      image: json['image'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$BannersDataToJson(BannersData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
