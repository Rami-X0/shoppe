import 'package:flutter/material.dart';
import 'package:shoppe/features/carts/data/models/carts_response.dart';
import 'package:shoppe/features/carts/ui/widgets/carts_view_item.dart';

class CartsView extends StatelessWidget {
  final CartsResponse favoritesResponse;

  const CartsView({
    super.key,
    required this.favoritesResponse,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: favoritesResponse.cartsData!.data!.length,
        itemBuilder: (context, index) {
          return CartsViewItem(

            cartsResponse: favoritesResponse,
            index: index,
          );
        });
  }
}
