import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_cached_network_image.dart';
import 'package:shoppe/features/home/data/models/categories_response.dart';

class CategoriesViewItem extends StatelessWidget {
  final CategoriesResponse categoriesResponse;
  final int index;

  const CategoriesViewItem({
    super.key,
    required this.categoriesResponse,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 10.h,
      ),
      width: 101.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: ColorsManager.darkBlue.withOpacity(0.2),
            blurRadius: 1,
            offset: const Offset(0, 5),
            spreadRadius: 2,
          )
        ],
      ),
      child: SizedBox(
        child: Stack(
          fit: StackFit.expand,
          children: [
            AppCachedNetworkImage(
              index: index,
              object: categoriesResponse.data!.categoriesData![index].image
                  .toString(),
            ),
            _categoriesTextName(),
          ],
        ),
      ),
    );
  }

  Widget _categoriesTextName() {
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
