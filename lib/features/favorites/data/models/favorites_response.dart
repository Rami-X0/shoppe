import 'package:json_annotation/json_annotation.dart';
part'favorites_response.g.dart';
@JsonSerializable()
class FavoritesResponse {
  final bool? status;
  @JsonKey(name: 'data')
  final FavoritesData? favoritesData;

  FavoritesResponse({
    this.status,
    this.favoritesData,
  });
  factory FavoritesResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoritesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesResponseToJson(this);
}

@JsonSerializable()
class FavoritesData {
  final List<Data>? data;

  FavoritesData({
    this.data,
  });
  factory FavoritesData.fromJson(Map<String, dynamic> json) =>
      _$FavoritesDataFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesDataToJson(this);
}

@JsonSerializable()
class Data {
  final int? id;
  final Product? product;

  Data({
    this.id,
    this.product,
  });
  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Product {
  final num? id;
  final num? price;
@JsonKey(name:'old_price')
  final num? oldPrice;
  final num? discount;
  final String? image;
  final String? name;
  final String? description;
  Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
