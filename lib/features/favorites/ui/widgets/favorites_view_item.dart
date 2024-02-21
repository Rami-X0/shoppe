import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widgets/app_cached_network_image.dart';
import 'package:shoppe/features/favorites/data/models/favorites_response.dart';
import 'package:shoppe/features/favorites/ui/widgets/name_favorites.dart';
import 'package:shoppe/features/favorites/ui/widgets/price_icon_favorites.dart';

class FavoritesViewItem extends StatelessWidget {
  final FavoritesResponse favoritesResponse;
  final int index;

  const FavoritesViewItem({
    super.key,
    required this.favoritesResponse,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.circular(10);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 3.h,
      ),
      decoration: BoxDecoration(
        color: ColorsManager.mainBlue.withOpacity(0.1),
        borderRadius: radius,
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration:
                BoxDecoration(color: Colors.white, borderRadius: radius),
            child: AppCachedNetworkImage(
              circular: 10,
              index: 1,
              object: favoritesResponse
                  .favoritesData!.data![index].product!.image
                  .toString(),
            ),
          ),
          horizontalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NameFavorites(
                favoritesResponse: favoritesResponse,
                index: index,
              ),
              verticalSpace(25),
              PriceIconFavorites(
                favoritesResponse: favoritesResponse,
                index: index,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
