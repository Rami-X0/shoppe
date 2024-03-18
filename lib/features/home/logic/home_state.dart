import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoppe/features/home/data/models/banners_response.dart';
import 'package:shoppe/features/home/data/models/categories_response.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loadingGetBanners() = LoadingGetBanners;

  const factory HomeState.successGetBanners({required BannersResponse data}) =
      SuccessGetBanners;

  const factory HomeState.loadingGetCategories() = LoadingGetCategories;

  const factory HomeState.successGetCategories(
      {required CategoriesResponse data,}) = SuccessGetCategories;
const factory HomeState.loadingGetProducts() = LoadingGetProducts;

  const factory HomeState.successGetProducts(
      {required ProductsResponse data}) = SuccessGetProducts;
}
