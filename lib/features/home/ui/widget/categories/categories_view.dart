import 'package:flutter/material.dart';
import 'package:shoppe/features/home/data/models/categories_response.dart';
import 'package:shoppe/features/home/ui/widget/categories/categories_view_item.dart';

class CategoriesView extends StatelessWidget {
final CategoriesResponse categoriesResponse;
  const CategoriesView({super.key, required this.categoriesResponse});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount:
      categoriesResponse.data!.categoriesData!.length,
      itemBuilder: (context, index) {
        return CategoriesViewItem(
          categoriesResponse: categoriesResponse,
          index: index,
        );
      },
    );
  }
}
