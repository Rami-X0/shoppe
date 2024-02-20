import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';
import 'package:shoppe/features/home/ui/widget/more_small_product_view_item.dart';

class MoreSmallProductView extends StatelessWidget {
  final ProductData productData;
  final int index;

  const MoreSmallProductView({
    super.key,
    required this.productData, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(

        width: 123.w,
        height: 50.h,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return horizontalSpace(0);
          },
          itemBuilder: (context, index) {
            return MoreSmallProductViewItem(productData: productData, index: index,);
          },
          itemCount:productData.images!.length,
        ),
      ),
    );
  }
}
