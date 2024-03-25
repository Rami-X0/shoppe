import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/features/carts/data/carts_repo/carts_repo.dart';
import 'package:shoppe/features/carts/data/models/carts_request.dart';
import 'package:shoppe/features/carts/logic/carts_state.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';

class CartsCubit extends Cubit<CartsState> {
  final CartsRepo _cartsRepo;
  final HomeCubit _homeCubit;

  CartsCubit(this._cartsRepo, this._homeCubit)
      : super(const CartsState.initial());

 Future <void> emitAddCarts(CartsRequest id) async {
    emit(const CartsState.loadingAddCarts());
    _homeCubit.carts[id.productId] = !_homeCubit.carts[id.productId]!;
    final response = await _cartsRepo.addCarts(id);
    response.whenOrNull(success: (cartsResponse) {
      if (!cartsResponse.status!) {
        _homeCubit.carts[id.productId] = !_homeCubit.carts[id.productId]!;
      }
      emitCarts();
      emit(CartsState.successAddCarts(cartsResponse));
    });
  }
  
  void emitCarts() async {
    emit(const CartsState.loadingGetCarts());
    final response = await _cartsRepo.carts();
    response.whenOrNull(success: (cartsResponse) {
      emit(CartsState.successGetCarts(cartsResponse));
    });
  }
}
