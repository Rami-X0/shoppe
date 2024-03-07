import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/carts/data/models/carts_response.dart';

class PriceCarts extends StatelessWidget {
  final CartsResponse favoritesResponse;
  final int index;

  const PriceCarts({
    super.key,
    required this.favoritesResponse,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          favoritesResponse.cartsData!.data![index].product!.price
              .toString(),
          style: TextStyles.font15MainBlueSemiBold,
        ),
        Gap(18.w),
        favoritesResponse.cartsData!.data![index].product!.discount! > 0
            ? Text(
                favoritesResponse.cartsData!.data![index].product!.oldPrice
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
