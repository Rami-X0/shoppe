import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';

class DiscountLoveProduct extends StatelessWidget {
  const DiscountLoveProduct({
    super.key,

  });


  final double radiusCircular = 15;
  final Color colorWidget = Colors.white70;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildDiscountLoveProduct(
          color: Colors.red,
          topRight: radiusCircular,
          bottomLeft: radiusCircular,
          child: Text(
            'Discount',
            style: TextStyles.font10WhiteBold,
          ),
        ),
        const Spacer(),
        _buildDiscountLoveProduct(
          color: ColorsManager.mainBlue,
          topLeft: radiusCircular,
          bottomRight: radiusCircular,
          child: const Icon(
            Icons.favorite,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget _buildDiscountLoveProduct({
    required Color color,
    required Widget child,
    double? bottomLeft,
    double? topRight,
    double? topLeft,
    double? bottomRight,
  }) {
    return Container(
      width: 50.w,
      height: 35.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(bottomLeft ?? 0),
          topRight: Radius.circular(topRight ?? 0),
          topLeft: Radius.circular(topLeft ?? 0),
          bottomRight: Radius.circular(bottomRight ?? 0),
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
