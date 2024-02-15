import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/features/home/data/banners_repo/banners_repo.dart';
import 'package:shoppe/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BannersRepo _bannersRepo;

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
}
