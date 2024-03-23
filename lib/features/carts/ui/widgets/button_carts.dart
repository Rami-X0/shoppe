import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/carts/data/models/carts_request.dart';
import 'package:shoppe/features/carts/logic/carts_cubit.dart';
import 'package:shoppe/features/carts/logic/carts_state.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonCarts extends StatelessWidget {
  final num productId;

  const ButtonCarts({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      buildWhen: (previous, current) =>
          current is LoadingAddCarts || current is SuccessAddCarts,
      builder: (context, state) {
        return Container(
          width: 50.w,
          height: 35.h,
          decoration: BoxDecoration(
            color: ColorsManager.mainBlue.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: GestureDetector(
            onTap: () {
              addProductCarts(context);
            },
            child: context.read<HomeCubit>().carts[productId]!
                ? favoriteIcon()
                : textWait(context),
          ),
        );
      },
    );
  }

  Center favoriteIcon() {
    return Center(
      child: FaIcon(
        FontAwesomeIcons.cartShopping,
        color: ColorsManager.mainBlue,
        size: 20.w,
      ),
    );
  }

  Center textWait(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context)!.wait,
        style: TextStyles.font14MainBlueBold.copyWith(
          fontSize: 11.sp,
        ),
      ),
    );
  }

  void addProductCarts(BuildContext context) {
    context.read<CartsCubit>().emitAddCarts(CartsRequest(productId: productId));
  }
}
