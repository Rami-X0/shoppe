import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';
import 'package:shoppe/features/home/ui/widget/products/discount_favorite_product.dart';
import 'package:shoppe/features/home/ui/widget/products/image_product.dart';
import 'package:shoppe/features/home/ui/widget/products/more_small_product_view.dart';
import 'package:shoppe/features/home/ui/widget/products/price_products.dart';
import 'name_products.dart';

class ProductViewItem extends StatelessWidget {
  final ProductsResponse productsResponse;
  final ProductData productData;
  final int index;

  const ProductViewItem({
    super.key,
    required this.productsResponse,
    required this.index,
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Container(
        width: 215.w,
        margin: EdgeInsets.symmetric(
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1 / 2),
              offset: const Offset(0, 5),
              spreadRadius: 0.5,
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            NameProducts(
              productsResponse: productsResponse,
              index: index,
            ),
            verticalSpace(5),
            PriceProducts(
              productsResponse: productsResponse,
              index: index,
            ),
            ImageProduct(
              productsResponse: productsResponse,
              productData: productData,
              index: index,
            ),
            verticalSpace(10),
            Align(
              alignment: Alignment.center,
              child: MoreSmallProductView(
                productData: productData,
                index: index,
              ),
            ),
            const Spacer(),
            DiscountFavoriteProduct(
              productsResponse: productsResponse,
              productData: productData,
              index: index,
            ),
          ],
        ),
      ),
    );
  }
}
