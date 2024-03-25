import 'package:flutter/material.dart';
import 'package:shoppe/core/routing/animation_routing/app_alignment_router.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widgets/app_slide_scale_fade_transition.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';
import 'package:shoppe/features/home/ui/widget/product_view/ui/product_view_screen.dart';
import 'package:shoppe/features/search/ui/widgets/search_image.dart';
import 'package:shoppe/features/search/ui/widgets/search_text.dart';

class SearchViewItem extends StatelessWidget {
  final ProductsResponse productsResponse;
  final int index;

  const SearchViewItem({
    super.key,
    required this.productsResponse,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          AppAlignmentRouter(
            ProductViewScreen(
              productData: productsResponse.data!.productData![index],
            ),
          ),
        );
      },
      child: AppSlideScaleFadeTransition(
        scaleOffsetEnd: 1,
        duration: 850,
        child: _buildItem(),
      ),
    );
  }


  Container _buildItem() {
    return Container(
      // width: 100.w,
      // height: 90.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          SearchImage(
            productData: productsResponse.data!.productData![index],
            productsResponse: productsResponse,
            index: index,
          ),
          const Divider(
            color: ColorsManager.skyBlue,
          ),
          TextSearch(
            productsResponse: productsResponse,
            index: index,
          )
        ],
      ),
    );
  }
}
