import 'package:json_annotation/json_annotation.dart';

part 'carts_request.g.dart';
@JsonSerializable()
class CartsRequest{
  @JsonKey(name: 'product_id')
  final num productId;

  CartsRequest({required this.productId});

  factory CartsRequest.fromJson(Map<String, dynamic> json) =>
      _$CartsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CartsRequestToJson(this);

}