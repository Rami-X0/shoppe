import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_cached_network_image.dart';
import 'package:shoppe/features/favorites/data/models/favorites_response.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritesImage extends StatelessWidget {
  final FavoritesResponse favoritesResponse;
  final int index;

  const FavoritesImage({
    super.key,
    required this.favoritesResponse,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 120.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: AppCachedNetworkImage(
            imageUrl: favoritesResponse
                .favoritesData!.data![index].product!.image
                .toString(),
          ),
        ),
        favoritesResponse.favoritesData!.data![index].product!.discount! > 0
            ? Container(
                width: 40.w,
                height: 28.h,
                decoration: BoxDecoration(
                  color: ColorsManager.mainBlue.withOpacity(0.9),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.discount,
                    style: TextStyles.font9WhiteSemiBold,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
