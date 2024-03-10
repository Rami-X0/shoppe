import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_loading.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:shoppe/features/home/logic/home_state.dart';
import 'package:shoppe/features/home/ui/widget/default_container_home.dart';
import 'package:shoppe/features/home/ui/widget/products/products_view.dart';

class BlocBuilderProducts extends StatelessWidget {
  const BlocBuilderProducts({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).emitProducts();
    return DefaultContainerHome(
      height: 581.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              'Products',
              style: TextStyles.font18MainBlueSemiBold,
            ),
          ),
          BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  current is LoadingGetProducts ||
                  current is SuccessGetProducts,
              builder: (context, state) {
                return state.maybeWhen(loadingGetProducts: () {
                  return SizedBox(
                    height: 300.h,
                    child: const AppLoading(),
                  );
                }, successGetProducts: (productsResponse) {
                  return ProductsView(productsResponse: productsResponse);
                }, orElse: () {
                  return const SizedBox.shrink();
                });
              }),
        ],
      ),
    );
  }
}
