// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesResponse _$FavoritesResponseFromJson(Map<String, dynamic> json) =>
    FavoritesResponse(
      status: json['status'] as bool?,
      favoritesData: json['data'] == null
          ? null
          : FavoritesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoritesResponseToJson(FavoritesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.favoritesData,
    };

FavoritesData _$FavoritesDataFromJson(Map<String, dynamic> json) =>
    FavoritesData(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FavoritesDataToJson(FavoritesData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as num?,
      price: json['price'] as num?,
      oldPrice: json['old_price'] as num?,
      discount: json['discount'] as num?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
    };
