import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/features/home/data/home_repo/home_repo.dart';
import 'package:shoppe/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _bannersRepo;

  HomeCubit(this._bannersRepo) : super(const HomeState.initial());

  void emitBanners() async {
    emit(const HomeState.loadingGetBanners());
    final response = await _bannersRepo.banners();
    response.whenOrNull(
      success: (bannersResponse) {
        emit(HomeState.successGetBanners(data: bannersResponse));
      },
    );
  }

  void emitCategories() async {
    emit(const HomeState.loadingGetCategories());
    final response = await _bannersRepo.categories();
    response.whenOrNull(
      success: (categoriesResponse) {
        emit(HomeState.successGetCategories(data: categoriesResponse));
      },
    );
  }

  Map<int, bool> favorites = {};

  void emitProducts() async {
    emit(const HomeState.loadingGetProducts());
    final response = await _bannersRepo.products();
    response.whenOrNull(
      success: (productsResponse) {
        for (var element in productsResponse.data!.productData!) {
          favorites.addAll({
            element.id!: element.inFavorites!,
          });
        }
        debugPrint(favorites.toString());
        emit(HomeState.successGetProducts(data: productsResponse));


        },
    );
  }
}
