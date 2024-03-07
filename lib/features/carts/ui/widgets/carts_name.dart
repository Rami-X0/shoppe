import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/carts/data/models/carts_response.dart';

class CartsName extends StatelessWidget {
  final CartsResponse cartsResponse;
  final int index;

  const CartsName({
    super.key,
    required this.cartsResponse,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 185.w,
      child: Text(
        cartsResponse.cartsData!.data![index].product!.name.toString(),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
style: TextStyles.font13DarkBlueRegular,
      ),
    );
  }
}
