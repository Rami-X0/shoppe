import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_cached_network_image.dart';
import 'package:shoppe/features/carts/data/models/carts_response.dart';

class CartsImage extends StatelessWidget {
  final CartsResponse cartsResponse;
  final int index;

  const CartsImage({
    super.key,
    required this.cartsResponse,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 120.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: AppCachedNetworkImage(
            object: cartsResponse.cartsData!.data![index].product!.image
                .toString(),
            index: index,
          ),
        ),
        cartsResponse.cartsData!.data![index].product!.discount!>0?
        Container(
          width: 40.w,
          height: 28.h,
          decoration:  BoxDecoration(
            color: Colors.red.withOpacity(0.9),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Center(
            child: Text('Discount', style: TextStyles.font9WhiteSemiBold),
          ),
        ):const SizedBox.shrink(),
      ],
    );
  }
}
