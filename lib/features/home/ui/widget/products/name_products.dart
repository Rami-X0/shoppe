import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';


class NameProducts extends StatelessWidget {
  final ProductsResponse productsResponse;
  final int index;

  const NameProducts(
      {super.key, required this.productsResponse, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Text(
            productsResponse.data!.productData![index].name.toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyles.font18MainBlueSemiBold.copyWith(
              color: ColorsManager.darkBlue,
            ),
          ),
        ),
        verticalSpace(10),
      ],
    );
  }
}
