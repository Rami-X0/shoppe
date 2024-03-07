import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/favorites/data/models/favorites_response.dart';

class PriceFavorites extends StatelessWidget {
  final FavoritesResponse favoritesResponse;
  final int index;

  const PriceFavorites({
    super.key,
    required this.favoritesResponse,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          favoritesResponse.favoritesData!.data![index].product!.price
              .toString(),
          style: TextStyles.font15MainBlueSemiBold,
        ),
        Gap(18.w),
        favoritesResponse.favoritesData!.data![index].product!.discount! > 0
            ? Text(
                favoritesResponse.favoritesData!.data![index].product!.oldPrice
                    .toString(),
                style: TextStyles.font15MainBlueSemiBold.copyWith(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.blueGrey),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
