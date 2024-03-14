import 'package:flutter/material.dart';
import 'package:shoppe/core/widgets/app_cached_network_image.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';

class SearchImage extends StatelessWidget {
  final ProductsResponse productsResponse;
  final ProductData productData;
  final int index;

  const SearchImage({
    super.key,
    required this.productsResponse,
    required this.index,
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    return AppCachedNetworkImage(
      widthImage: 150,
      heightImage: 150,
      imageUrl: productsResponse.data!.productData![index].image.toString(),
    );
  }
}
