import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/di/dependency_injection.dart';
import 'package:shoppe/core/widgets/app_loading.dart';
import 'package:shoppe/features/carts/logic/carts_cubit.dart';
import 'package:shoppe/features/carts/logic/carts_state.dart';
import 'package:shoppe/features/carts/ui/widgets/carts_view.dart';

class BlocBuilderCartsView extends StatelessWidget {
  const BlocBuilderCartsView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartsCubit>(context).emitCarts();
    return BlocProvider<CartsCubit>.value(
      value: getIt<CartsCubit>(),
      child: BlocBuilder<CartsCubit, CartsState>(
        buildWhen: (previous, current) =>
        current is SuccessGetCarts,
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const SizedBox.shrink();
            },
            loadingGetCarts: () {
              return const AppLoading();
            },
            successGetCarts: (favoritesResponse) {
              return CartsView(
                favoritesResponse: favoritesResponse,
              );
            },
          );
        },
      ),
    );
  }
}
