import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/helper/extension.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/favorites/ui/widgets/app_button_favorite.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:shoppe/features/home/ui/widget/product_view/ui/widgets/inkwell_product_view.dart';
import 'package:shoppe/features/home/ui/widget/app_button_favorite_home.dart';

class AppBarProductView extends StatelessWidget {
  final ProductData productData;

  const AppBarProductView({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWellProductView(
            onTap: () {
              context.pop();
              context.read<HomeCubit>().activePage = 0;
            },
            circular: 10,
            height: 40,
            width: 50,
            child: FaIcon(
              FontAwesomeIcons.arrowLeft,
              size: 24.w,
              color: ColorsManager.mainBlue,
            ),
          ),
          Text(
            'Product Details',
            style: TextStyles.font14MainBlueBold.copyWith(fontSize: 18.sp),
          ),
          AppButtonFavoriteHome(
            favoriteIconColor: ColorsManager.mainBlue,
            productId: productData.id!,
          )
        ],
      ),
    );
  }
}
