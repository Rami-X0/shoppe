import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';
import 'package:shoppe/features/search/ui/widgets/search_view_item.dart';

class SearchView extends StatelessWidget {
  final ProductsResponse productsResponse;

  const SearchView({super.key, required this.productsResponse});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 5.h,
        ),
        shrinkWrap: true,
        itemCount: productsResponse.data!.productData!.length,
        itemBuilder: (context, index) {
          return SearchViewItem(
            index: index,
            productsResponse: productsResponse,

          );
        },
      ),
    );
  }
}
