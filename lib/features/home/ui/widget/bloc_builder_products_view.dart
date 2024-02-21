import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_loading.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:shoppe/features/home/logic/home_state.dart';
import 'package:shoppe/features/home/ui/widget/default_container_home.dart';
import 'package:shoppe/features/home/ui/widget/product_view.dart';

class BlocBuilderProductsView extends StatefulWidget {
  const BlocBuilderProductsView({super.key});

  @override
  State<BlocBuilderProductsView> createState() => _BlocBuilderProductsViewState();
}

class _BlocBuilderProductsViewState extends State<BlocBuilderProductsView> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    BlocProvider.of<HomeCubit>(context).emitProducts();
    return DefaultContainerHome(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              'Products',
              style: TextStyles.font18DarkBlueSemiBold,
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
                  return ProductView(productsResponse: productsResponse);
                }, orElse: () {
                  return const SizedBox.shrink();
                });
              }),
        ],
      ),
    );
  }
}