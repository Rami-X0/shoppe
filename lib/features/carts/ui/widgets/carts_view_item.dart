import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widgets/app_slide_scale_fade_transition.dart';
import 'package:shoppe/features/carts/data/models/carts_response.dart';
import 'package:shoppe/features/carts/ui/widgets/button_carts.dart';
import 'package:shoppe/features/carts/ui/widgets/carts_image.dart';
import 'package:shoppe/features/carts/ui/widgets/carts_name.dart';

import 'package:shoppe/features/carts/ui/widgets/price_icon_favorites.dart';

class CartsViewItem extends StatelessWidget {
  final CartsResponse cartsResponse;
  final int index;

  const CartsViewItem({
    super.key,
    required this.cartsResponse,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.circular(10);
    return AppSlideScaleFadeTransition(
      scaleOffsetEnd: 3,

      child: Container(
        height: 150.h,
        margin: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 3.h,
        ),
        decoration: BoxDecoration(
          color: ColorsManager.mainBlue.withOpacity(0.1),
          borderRadius: radius,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 6.w,
            vertical: 10.h,
          ),
          child: _imageFavorite(),
        ),
      ),
    );
  }

  Row _imageFavorite() {
    return Row(
      children: [
        CartsImage(
          cartsResponse:cartsResponse ,
          index: index,
        ),
        horizontalSpace(10),
        _nameAndPriceAndIconFavorite(),
      ],
    );
  }

  Column _nameAndPriceAndIconFavorite() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(20.h),
        CartsName(
          cartsResponse: cartsResponse,
          index: index,
        ),
        Gap(50.h),
        SizedBox(
          width: 160.w,
          child: Row(
            children: [
              PriceCarts(
                favoritesResponse: cartsResponse,
                index: index,
              ),
              const Spacer(),
              ButtonCarts(
                productId: cartsResponse.cartsData!.data![index].product!.id!,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
