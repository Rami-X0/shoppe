import 'package:json_annotation/json_annotation.dart';

part 'favorites_add_response.g.dart';

@JsonSerializable()
class FavoritesAddResponse {
  final bool? status;
  final String? message;

  FavoritesAddResponse({
    this.status,
    this.message,
  });
  factory FavoritesAddResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoritesAddResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesAddResponseToJson(this);

}
