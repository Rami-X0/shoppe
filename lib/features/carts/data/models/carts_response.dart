import 'package:json_annotation/json_annotation.dart';
part'carts_response.g.dart';
@JsonSerializable()
class CartsResponse {
  final bool? status;
  @JsonKey(name: 'data')
  final CartsData? cartsData;

  CartsResponse({
    this.status,
    this.cartsData,
  });
  factory CartsResponse.fromJson(Map<String, dynamic> json) =>
      _$CartsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartsResponseToJson(this);
}

@JsonSerializable()
class CartsData {
 @JsonKey(name:'cart_items' )
  final List<Data>? data;

  CartsData({
    this.data,
  });
  factory CartsData.fromJson(Map<String, dynamic> json) =>
      _$CartsDataFromJson(json);

  Map<String, dynamic> toJson() => _$CartsDataToJson(this);
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
