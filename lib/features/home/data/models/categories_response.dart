import 'package:json_annotation/json_annotation.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse {
  final bool? status;
  final String? message;
  final Data? data;

  CategoriesResponse({
    this.status,
    this.message,
    this.data,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}

@JsonSerializable()
class Data{
  @JsonKey(name: 'data')
  List<CategoriesData>?categoriesData;

  Data({this.categoriesData});
  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
@JsonSerializable()
class CategoriesData {
  final int? id;
  final String? name;
  final String? image;

  CategoriesData({
    this.id,
    this.name,
    this.image,
  });

  factory CategoriesData.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesDataToJson(this);
}
