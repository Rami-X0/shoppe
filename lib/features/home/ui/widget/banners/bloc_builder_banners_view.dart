import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/widgets/app_loading.dart';
import 'package:shoppe/core/widgets/app_slide_scale_fade_transition.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:shoppe/features/home/logic/home_state.dart';
import 'package:shoppe/features/home/ui/widget/banners/banners_view.dart';
import 'package:shoppe/features/home/ui/widget/default_container_home.dart';

class BlocBuilderBannersView extends StatefulWidget {
  const BlocBuilderBannersView({
    super.key,
  });

  @override
  State<BlocBuilderBannersView> createState() => _BlocBuilderBannersViewState();
}

class _BlocBuilderBannersViewState extends State<BlocBuilderBannersView> with
AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    BlocProvider.of<HomeCubit>(context).emitBanners();
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 10.w,
      ),
      child: AppSlideScaleFadeTransition(
        scaleOffsetEnd: 4,
        child: AppSlideScaleFadeTransition(
          scaleOffsetEnd: 8,
          child: DefaultContainerHome(
            height: 205,
            child: BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  current is LoadingGetBanners || current is SuccessGetBanners,
              builder: (context, state) {
                return state.maybeWhen(
                  loadingGetBanners: () {
                    return const AppLoading();
                  },
                  successGetBanners: (bannersResponse) {
                    return BannersView(
                      bannersResponse: bannersResponse,
                    );
                  },
                  orElse: () {
                    return const SizedBox.shrink();
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
