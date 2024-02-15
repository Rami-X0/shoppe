import 'package:json_annotation/json_annotation.dart';

part 'banners_response.g.dart';

@JsonSerializable()
class BannersResponse {
  final bool? status;
  @JsonKey(name: 'data')
  List<BannersData>? bannersData;

  BannersResponse({
    this.status,
    this.bannersData,
  });

  factory BannersResponse.fromJson(Map<String, dynamic> json) =>
      _$BannersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BannersResponseToJson(this);
}

@JsonSerializable()
class BannersData {
  final int? id;
  final String? image;

  BannersData({
    this.image,
    this.id,
  });

  factory BannersData.fromJson(Map<String, dynamic> json) =>
      _$BannersDataFromJson(json);

  Map<String, dynamic> toJson() => _$BannersDataToJson(this);
}
