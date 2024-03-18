import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widgets/app_cached_network_image.dart';
import 'package:shoppe/core/widgets/app_smooth_swipe.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:shoppe/features/home/ui/widget/button_carts_home.dart';

class ProductImagesView extends StatefulWidget {
  final ProductData productData;

  const ProductImagesView({
    super.key,
    required this.productData,
  });

  @override
  State<ProductImagesView> createState() => _ProductImagesViewState();
}

class _ProductImagesViewState extends State<ProductImagesView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          height: 265.h,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [

                BoxShadow(
                  color: ColorsManager.mainBlue.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                  spreadRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.circular(5)),
          child: _buildPgaViewImageProductView(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: AppSmoothSwipe(
            itemLength: widget.productData.images!.length,
            activePage: context.read<HomeCubit>().activePage,
          ),
        ),
        _buttonCart()
      ],
    );
  }
Widget _buttonCart(){
    return   Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.h,
        horizontal: 10.w,
      ),
      child: Align(
        alignment: AlignmentDirectional.bottomEnd,

        child: CircleAvatar(
          backgroundColor: ColorsManager.darkBlue.withOpacity(0.1),
          child: ButtonCartsHome(productId: widget.productData.id!),
        ),
      ),
    );
}
  Widget _buildPgaViewImageProductView() {
    return PageView.builder(
      itemCount: widget.productData.images!.length,
      scrollDirection: Axis.horizontal,
      onPageChanged: (index) {
        setState(() {
          context.read<HomeCubit>().activePage = index;
        });
      },
      itemBuilder: (context, index) {
        return Hero(
          tag: widget.productData.id.toString(),
          child: AppCachedNetworkImage(
            imageUrl: widget.productData.images![index],
          ),
        );
      },
    );
  }
}
