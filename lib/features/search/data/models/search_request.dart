import 'package:json_annotation/json_annotation.dart';

part 'search_request.g.dart';

@JsonSerializable()
class SearchRequest {
  @JsonKey(name: 'text')
  final String productName;

  SearchRequest({
    required this.productName,
  });

  factory SearchRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchRequestToJson(this);
}
