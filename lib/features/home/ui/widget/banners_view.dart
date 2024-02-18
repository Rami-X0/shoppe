import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widgets/app_loading.dart';
import 'package:shoppe/features/home/data/models/banners_response.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:shoppe/features/home/logic/home_state.dart';
import 'package:shoppe/features/home/ui/widget/banners_view_item.dart';

class BannersPageView extends StatelessWidget {
  const BannersPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).emitBanners();
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 10.w,
      ),
      child: Container(
        height: 235.h,
        width: 335.w,
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 3.h,
        ),
        decoration: BoxDecoration(
          color: ColorsManager.mainBlue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              current is LoadingGetBanners || current is SuccessGetBanners,
          builder: (context, state) {
            return state.maybeWhen(
              loadingGetBanners: () {
                return const AppLoading();
              },
              successGetBanners: (bannersResponse) {
                return _carouselSlider(bannersResponse);
              },
              orElse: () {
                return const SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }

  Widget _carouselSlider(BannersResponse bannersResponse) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        initialPage: 2,
        autoPlay: true,
        autoPlayCurve: Curves.linear,
        enlargeCenterPage: true,
        animateToClosest: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 750),
      ),
      itemCount: bannersResponse.bannersData!.length,
      itemBuilder: (context, index, realIndex) {
        return BannersViewItem(
          bannersResponse: bannersResponse,
          index: index,
        );
      },
    );
  }
}
