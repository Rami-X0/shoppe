import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/di/dependency_injection.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/features/carts/logic/carts_cubit.dart';
import 'package:shoppe/features/favorites/logic/favorites_cubit.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:shoppe/features/home/ui/widget/product_view/ui/widgets/app_bar_product_view.dart';
import 'package:shoppe/features/home/ui/widget/product_view/ui/widgets/pay_product_view.dart';
import 'package:shoppe/features/home/ui/widget/product_view/ui/widgets/product_details_view.dart';
import 'package:shoppe/features/home/ui/widget/product_view/ui/widgets/product_images_view.dart';
import 'package:shoppe/features/home/ui/widget/product_view/ui/widgets/product_name_view.dart';

class ProductViewScreen extends StatelessWidget {
  final ProductData productData;

  const ProductViewScreen({
    super.key,
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>.value(
          value: getIt<HomeCubit>(),
        ),
        BlocProvider<FavoritesCubit>.value(
          value: getIt<FavoritesCubit>(),
        ),
        BlocProvider<CartsCubit>.value(
          value: getIt<CartsCubit>(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          automaticallyImplyLeading: false,
          title: AppBarProductView(
            productData: productData,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProductImagesView(productData: productData),
                verticalSpace(18),
                _dividerProductView(),
                ProductNameView(productData: productData),
                _dividerProductView(),
                verticalSpace(8),
                ProductDetailsView(productData: productData),
                verticalSpace(4),
                const PayProductView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Divider _dividerProductView() {
    return Divider(
      color: ColorsManager.mainBlue.withOpacity(0.3),
    );
  }
}