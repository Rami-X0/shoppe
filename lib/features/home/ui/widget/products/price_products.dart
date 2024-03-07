import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';

class PriceProducts extends StatelessWidget {
  final ProductsResponse productsResponse;
  final int index;

  const PriceProducts({
    super.key,
    required this.index,
    required this.productsResponse,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        priceProduct(
          text: 'Price',
          price: productsResponse.data!.productData![index].price.toString(),
        ),
        productsResponse.data!.productData![index].discount! > 0
            ? priceProduct(
                text: 'Old Price',
                price: productsResponse.data!.productData![index].oldPrice
                    .toString(),
                iconPriceColor: ColorsManager.moreLighterGray,
                priceColor: ColorsManager.moreLighterGray,
                decorationPrice: TextDecoration.lineThrough,
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Column priceProduct({
    required String text,
    required String price,
    Color? iconPriceColor,
    Color? priceColor,
    TextDecoration? decorationPrice,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyles.font14LightGrayMedium,
        ),
        Row(
          children: [
            FaIcon(
              FontAwesomeIcons.alignRight,
              size: 13.w,
              color: iconPriceColor ?? ColorsManager.mainBlue,
            ),
            horizontalSpace(5),
            Text(
              price.replaceAll('.0', ' '),
              style: TextStyles.font15MainBlueSemiBold.copyWith(
                color: priceColor,
                decoration: decorationPrice,
                decorationColor: ColorsManager.darkBlue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
