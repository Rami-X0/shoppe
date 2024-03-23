import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/favorites/logic/favorites_cubit.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';
import 'package:shoppe/features/home/ui/widget/button_favorites_home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DiscountFavoriteProduct extends StatelessWidget {
  final ProductsResponse productsResponse;
  final ProductData productData;
  final int index;

  const DiscountFavoriteProduct({
    super.key,
    required this.productsResponse,
    required this.index,
    required this.productData,
  });

  final double radiusCircular = 15;

  final Color colorWidget = Colors.white70;

  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        productsResponse.data!.productData![index].discount! > 0
            ? _buildDiscountLoveProduct(
                color: Colors.red,
                topRight: radiusCircular,
                bottomLeft: radiusCircular,
                child: Text(
                  AppLocalizations.of(context)!.discount,
                  style: TextStyles.font10WhiteBold,
                ),
              )
            : const SizedBox.shrink(),
        const Spacer(),
        GestureDetector(
          onTap: () {
            context
                .read<FavoritesCubit>()
                .addProductFavorites(context, productData);
          },
          child: _buildDiscountLoveProduct(
            color: ColorsManager.mainBlue,
            topLeft: radiusCircular,
            bottomRight: radiusCircular,
            child: ButtonFavoriteHome(
              favoriteIconColor: Colors.white70,
              productId: productsResponse.data!.productData![index].id!,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDiscountLoveProduct({
    required Color color,
    required Widget child,
    double? bottomLeft,
    double? topRight,
    double? topLeft,
    double? bottomRight,
  }) {
    return Container(
      width: 50.w,
      height: 35.h,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: ColorsManager.moreLightGray, width: 1.5),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(bottomLeft ?? 0),
          topRight: Radius.circular(topRight ?? 0),
          topLeft: Radius.circular(topLeft ?? 0),
          bottomRight: Radius.circular(bottomRight ?? 0),
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
