import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widgets/app_cached_network_image.dart';
import 'package:shoppe/features/home/data/models/banners_response.dart';

class BannersViewItem extends StatelessWidget {
  final BannersResponse bannersResponse;
  final int index;

  const BannersViewItem({
    super.key,
    required this.bannersResponse,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.darkBlue.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(-10, 25),
              spreadRadius: 5,
            )
          ],
        ),
        child: AppCachedNetworkImage(
         widthImage: 285,
          fitImage: BoxFit.cover,
          index: index,
          object: bannersResponse.bannersData![index].image.toString(),)
    );
  }


}
