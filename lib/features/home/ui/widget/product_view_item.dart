import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/widgets/app_cached_network_image.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';
import 'package:shoppe/features/home/ui/widget/discount_love_product.dart';
import 'package:shoppe/features/home/ui/widget/more_small_product_view.dart';
import 'package:shoppe/features/home/ui/widget/price_products.dart';
import 'package:shoppe/features/home/ui/widget/name_product.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Container(
        height: 381.h,
        margin: EdgeInsets.symmetric(
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            NameProduct(
              productsResponse: productsResponse,
              index: index,
            ),
            verticalSpace(5),
            PriceProducts(productsResponse: productsResponse, index: index,),
            Center(
              child: Container(
                width: 175.w,
                height: 175.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: AppCachedNetworkImage(
                  object: productsResponse.data!.productData![index].image
                      .toString(),
                  index: index,
                ),
              ),
            ),
            verticalSpace(10),
            Align(
              alignment: Alignment.centerLeft,
              child: MoreSmallProductView(
                productData: productData,
                index: index,
              ),
            ),
            verticalSpace(10),
            const DiscountLoveProduct(),
          ],
        ),
      ),
    );
  }
}
