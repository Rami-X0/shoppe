import 'package:flutter/material.dart';
import 'package:shoppe/features/favorites/data/models/favorites_response.dart';
import 'package:shoppe/features/favorites/ui/widgets/favorites_view_item.dart';

class FavoritesView extends StatelessWidget {
  final FavoritesResponse favoritesResponse;

  const FavoritesView({
    super.key,
    required this.favoritesResponse,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 500,
      child: ListView.builder(
          itemCount: favoritesResponse.favoritesData!.data!.length,
          itemBuilder: (context, index) {
        return FavoritesViewItem(
          favoritesResponse: favoritesResponse,
          index: index,
        );
      }),
    );
  }
}
