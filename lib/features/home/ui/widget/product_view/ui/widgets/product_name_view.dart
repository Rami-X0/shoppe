import 'package:flutter/material.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';

class ProductNameView extends StatelessWidget {
  final ProductData productData;

  const ProductNameView({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return Text(
      productData.name.toString(),
      style: TextStyles.font14MainBlueBold,
      maxLines: 2,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
  }
}
