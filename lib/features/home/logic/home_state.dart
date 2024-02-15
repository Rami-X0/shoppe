import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoppe/features/home/data/models/banners_response.dart';
part'home_state.freezed.dart';
@freezed
abstract class HomeState with _$HomeState {

  const factory HomeState.initial()= _Initial;

  const factory HomeState.loadingGetBanners()= LoadingGetBanners;

  const factory HomeState.successGetBanners({required BannersResponse data})= SuccessGetBanners;

}
