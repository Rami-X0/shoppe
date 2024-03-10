import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';

class TextSearch extends StatelessWidget {
  final ProductsResponse productsResponse;
  final int index;

  const TextSearch({super.key, required this.productsResponse, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.w),
      child: Text(
        productsResponse.data!.productData![index].name.toString(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyles.font14MainBlueBold,
      ),
    );
  }
}
