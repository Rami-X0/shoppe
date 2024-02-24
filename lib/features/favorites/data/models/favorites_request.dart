import 'package:json_annotation/json_annotation.dart';

part 'favorites_request.g.dart';
@JsonSerializable()
class FavoritesRequest{
  @JsonKey(name: 'product_id')
  final int productId;

  FavoritesRequest({required this.productId});

  factory FavoritesRequest.fromJson(Map<String, dynamic> json) =>
      _$FavoritesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesRequestToJson(this);

}