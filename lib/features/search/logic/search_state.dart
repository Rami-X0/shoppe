import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = Initial;

  const factory SearchState.loadingSearch() = LoadingSearch;

  const factory SearchState.successSearch(ProductsResponse productsResponse) =
      SuccessSearch;
}
