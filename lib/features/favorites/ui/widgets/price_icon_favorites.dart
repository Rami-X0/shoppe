import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/favorites/data/models/favorites_response.dart';

class PriceIconFavorites extends StatelessWidget {
  final FavoritesResponse favoritesResponse;
  final int index;

  const PriceIconFavorites({
    super.key,
    required this.favoritesResponse,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              favoritesResponse.favoritesData!.data![index].product!.price
                  .toString(),
              style: TextStyles.font15MainBlueSemiBold,
            ),
            verticalSpace(15),
            favoritesResponse.favoritesData!.data![index].product!.discount! > 0 ?

            Text(
              favoritesResponse.favoritesData!.data![index].product!.oldPrice
                  .toString(),
              style: TextStyles.font15MainBlueSemiBold.copyWith(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.blueGrey),
            )

                :const SizedBox.shrink(),
          ],

        ),
        horizontalSpace(115),
        const FaIcon(
          FontAwesomeIcons.solidHeart,
          color: ColorsManager.mainBlue,
        ),
      ],
    );
  }
}
