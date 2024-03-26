import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widgets/app_icon_button_and_tool_tip.dart';
import 'package:shoppe/core/widgets/app_snack_bar.dart';
import 'package:shoppe/features/carts/data/models/carts_request.dart';
import 'package:shoppe/features/carts/logic/carts_cubit.dart';
import 'package:shoppe/features/carts/logic/carts_state.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ButtonCartsHome extends StatelessWidget {
  final num productId;

  const ButtonCartsHome({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartsCubit, CartsState>(
      buildWhen: (previous, current) =>
          current is LoadingAddCarts || current is SuccessAddCarts,
      builder: (context, state) {
        return AppIconButtonAndToolTip(
          toolTipMessage: AppLocalizations.of(context)!.carts,
          onTap: () {
            context.read<CartsCubit>().emitAddCarts(
                  CartsRequest(productId: productId),
                );
          },
          icon: context.read<HomeCubit>().carts[productId]!
              ? FontAwesomeIcons.cartShopping
              : Icons.shopping_cart_outlined,
        );
      },
        listener: (context, state) {
          state.whenOrNull(

            successAddCarts: (data) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              appSnackBar(
                text: data.message.toString(),
                backGroundColor:data.status! ? ColorsManager.darkBlue : Colors.red,
                context: context,
              );
            },
          );
        }
    );
  }
}
