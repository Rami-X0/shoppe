import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/widgets/app_loading.dart';
import 'package:shoppe/core/widgets/app_no_data.dart';
import 'package:shoppe/features/carts/logic/carts_cubit.dart';
import 'package:shoppe/features/carts/logic/carts_state.dart';
import 'package:shoppe/features/carts/ui/widgets/carts_view.dart';

class BlocBuilderCartsView extends StatelessWidget {
  const BlocBuilderCartsView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartsCubit>(context).emitCarts();
    return BlocBuilder<CartsCubit, CartsState>(
      buildWhen: (previous, current) => current is SuccessGetCarts,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const SizedBox.shrink();
          },
          loadingGetCarts: () {
            return const AppLoading();
          },
          successGetCarts: (cartsResponse) {
            if (cartsResponse.cartsData!.data!.isEmpty) {
              return const AppNoData();
            }
            return CartsView(
              cartsResponse: cartsResponse,
            );
          },
        );
      },
    );
  }
}
