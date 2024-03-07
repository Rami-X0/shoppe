import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/routing/animation_routing/app_alignment_router.dart';
import 'package:shoppe/core/widgets/app_cached_network_image.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';
import 'package:shoppe/features/home/ui/widget/product_view/ui/product_view_screen.dart';

class ImageProduct extends StatelessWidget {
  final ProductsResponse productsResponse;
  final ProductData productData;
  final int index;

  const ImageProduct({
    super.key,
    required this.productsResponse,
    required this.index,
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 195.w,
        height: 195.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              AppAlignmentRouter(
                ProductViewScreen(
                  productData: productsResponse.data!.productData![index],
                ),
              ),
            );
          },
          child: Hero(
            tag: productData.id.toString(),
            child: AppCachedNetworkImage(
              object:
                  productsResponse.data!.productData![index].image.toString(),
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}
