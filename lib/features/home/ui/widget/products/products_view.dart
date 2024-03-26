import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';
import 'package:shoppe/features/home/ui/widget/products/product_view_item.dart';

class ProductsView extends StatelessWidget {
  final ProductsResponse productsResponse;

  const ProductsView({
    super.key,
    required this.productsResponse,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 415.h,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: productsResponse.data!.productData!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductViewItem(
              productsResponse: productsResponse,
              index: index,
              productData: productsResponse.data!.productData![index],
            );
         }),
    );
  }
}
