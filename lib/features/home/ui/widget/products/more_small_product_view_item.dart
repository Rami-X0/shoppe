import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widgets/app_cached_network_image.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';

class MoreSmallProductViewItem extends StatelessWidget {
  final ProductData productData;
  final int index;

  const MoreSmallProductViewItem({
    super.key,
    required this.productData,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: ColorsManager.grey.withOpacity(0.5),
          width: 1.3,
        ),
      ),
      child: SizedBox(
        width: 35.w,
        child: AppCachedNetworkImage(
          widthImage: 15,
          heightImage: 15,
          circular: 1,
          imageUrl: productData.images![index].toString(),
        ),
      ),
    );
  }
}
