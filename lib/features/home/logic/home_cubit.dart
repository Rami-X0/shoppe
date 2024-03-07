import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/features/home/data/home_repo/home_repo.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';
import 'package:shoppe/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  int activePage = 0;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void emitBanners() async {
    emit(const HomeState.loadingGetBanners());
    final response = await _homeRepo.banners();
    response.whenOrNull(
      success: (bannersResponse) {
        emit(HomeState.successGetBanners(data: bannersResponse));
      },
    );
  }

  void emitCategories() async {
    emit(const HomeState.loadingGetCategories());
    final response = await _homeRepo.categories();
    response.whenOrNull(
      success: (categoriesResponse) {
        emit(HomeState.successGetCategories(data: categoriesResponse));
      },
    );
  }

  Map<num, bool> favorites = {};
  Map<num, bool> carts = {};

  void emitProducts() async {
    emit(const HomeState.loadingGetProducts());
    final response = await _homeRepo.products();
    response.whenOrNull(
      success: (productsResponse) {
        addFavoritesMap(productsResponse, favorites);
        addCartsMap(productsResponse, carts);
        emit(HomeState.successGetProducts(data: productsResponse));
      },
    );
  }

  void addFavoritesMap(ProductsResponse productsResponse, Map<num, bool> map) {
    for (var element in productsResponse.data!.productData!) {
      map.addAll({
        element.id!: element.inFavorites!,
      });
    }
  }

  void addCartsMap(
    ProductsResponse productsResponse,
    Map<num, bool> map,
  ) {
    for (var element in productsResponse.data!.productData!) {
      map.addAll({
        element.id!: element.inCart!,
      });
    }
  }
}
