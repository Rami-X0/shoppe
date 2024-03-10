import 'package:flutter/material.dart';
import 'package:shoppe/features/carts/data/models/carts_response.dart';
import 'package:shoppe/features/carts/ui/widgets/carts_view_item.dart';

class CartsView extends StatelessWidget {
  final CartsResponse cartsResponse;

  const CartsView({
    super.key,
    required this.cartsResponse,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cartsResponse.cartsData!.data!.length,
        itemBuilder: (context, index) {
          return CartsViewItem(

            cartsResponse: cartsResponse,
            index: index,
          );
        });
  }
}
