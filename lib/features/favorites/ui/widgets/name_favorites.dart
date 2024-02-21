import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/features/favorites/data/models/favorites_response.dart';

class NameFavorites extends StatelessWidget {
  final FavoritesResponse favoritesResponse;
  final int index;

  const NameFavorites({
    super.key,
    required this.favoritesResponse,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240.w,
      child: Text(
        favoritesResponse.favoritesData!.data![index].product!.name.toString(),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
