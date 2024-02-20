import 'package:flutter/material.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';
import 'package:shoppe/features/home/ui/widget/product_view_item.dart';

class ProductView extends StatelessWidget {
  final ProductsResponse productsResponse;

  const ProductView({
    super.key,
    required this.productsResponse,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: productsResponse.data!.productData!.length,
        itemBuilder: (context, index) {
          return ProductViewItem(
            productsResponse: productsResponse,
            index: index,
            productData: productsResponse.data!.productData![index],
          );
        });
  }
}
