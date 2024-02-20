import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/home/data/models/categories_response.dart';

class CategoriesName extends StatelessWidget {
  final CategoriesResponse categoriesResponse;
  final int index;
  const CategoriesName({super.key, required this.categoriesResponse, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 95.h),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(14), bottomRight: Radius.circular(14)),
      ),
      height: 100.h,
      child: Center(
        child: Text(
          categoriesResponse.data!.categoriesData![index].name.toString(),
          style: TextStyles.font13WhiteSemiBold,
        ),
      ),
    );
  }
}
