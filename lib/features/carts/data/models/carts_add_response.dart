import 'package:json_annotation/json_annotation.dart';

part 'carts_add_response.g.dart';

@JsonSerializable()
class CartsAddResponse {
  final bool? status;
  final String? message;

  CartsAddResponse({
    this.status,
    this.message,
  });
  factory CartsAddResponse.fromJson(Map<String, dynamic> json) =>
      _$CartsAddResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartsAddResponseToJson(this);

}
