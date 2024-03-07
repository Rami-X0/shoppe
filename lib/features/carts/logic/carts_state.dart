import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoppe/features/carts/data/models/carts_add_response.dart';
import 'package:shoppe/features/carts/data/models/carts_response.dart';

part 'carts_state.freezed.dart';

@freezed
class CartsState with _$CartsState {
  const factory CartsState.initial() = Initial;

  const factory CartsState.loadingAddCarts() = LoadingAddCarts;

  const factory CartsState.successAddCarts(CartsAddResponse cartsResponse) =
      SuccessAddCarts;

  const factory CartsState.loadingGetCarts() = LoadingGetCarts;

  const factory CartsState.successGetCarts(CartsResponse cartsResponse) =
      SuccessGetCarts;
}
