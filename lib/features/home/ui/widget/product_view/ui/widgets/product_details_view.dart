import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';
import 'package:shoppe/features/home/ui/widget/button_carts_home.dart';
import 'package:shoppe/features/home/ui/widget/product_view/ui/widgets/inkwell_product_view.dart';

class ProductDetailsView extends StatefulWidget {
  final ProductData productData;

  const ProductDetailsView({super.key, required this.productData});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  bool productDetails = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Price\n',
                          style: TextStyles.font14LightGrayMedium.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: ColorsManager.lighterGray),
                        ),
                        TextSpan(
                          text: widget.productData.price
                              .toString()
                              .replaceAll('.0', ''),
                          style: TextStyles.font14MainBlueBold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _theProductDetails(),
            ],
          ),
          verticalSpace(10),
          _descriptionProductView(),
        ],
      ),
    );
  }

  AnimatedContainer _descriptionProductView() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      padding: EdgeInsets.symmetric(vertical: 5.h),
      height: productDetails ? 205.h : 75.h,
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: ColorsManager.mainBlue.withOpacity(0.2), width: 0.5),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.mainBlue.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
              spreadRadius: 5,
            ),
          ]),
      child: SingleChildScrollView(
        child: Text(
          widget.productData.description.toString(),
          textAlign: TextAlign.center,
          style: TextStyles.font14MainBlueBold
              .copyWith(color: ColorsManager.mainBlue.withOpacity(0.8)),
        ),
      ),
    );
  }

  Widget _theProductDetails() {
    return InkWellProductView(
        messageToolTip: 'details',
        height: 40,
        onTap: () {
          setState(() {
            productDetails = !productDetails;
          });
        },
        width: 110,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Details',
                style: TextStyles.font18MainBlueSemiBold
                    .copyWith(color: ColorsManager.mainBlue)),
            horizontalSpace(20),
            FaIcon(
              productDetails
                  ? FontAwesomeIcons.caretUp
                  : FontAwesomeIcons.caretDown,
              size: 22.w,
              color: ColorsManager.mainBlue,
            )
          ],
        ));
  }
}
