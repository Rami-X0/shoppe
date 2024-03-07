import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/widgets/app_icon_button_and_tool_tip.dart';
import 'package:shoppe/features/carts/data/models/carts_request.dart';
import 'package:shoppe/features/carts/logic/carts_cubit.dart';
import 'package:shoppe/features/carts/logic/carts_state.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';

class ButtonCartsHome extends StatelessWidget {
  final num productId;

  const ButtonCartsHome({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      buildWhen: (previous, current) =>
          current is LoadingAddCarts || current is SuccessAddCarts,
      builder: (context, state) {
        return AppIconButtonAndToolTip(
          toolTipMessage: 'cart',
          onTap: () {
            context
                .read<CartsCubit>()
                .emitAddCarts(CartsRequest(productId: productId));
          },
          icon: context.read<HomeCubit>().carts[productId]!
              ? FontAwesomeIcons.cartShopping
              : Icons.shopping_cart_outlined,
        );
      },
    );
  }
}
