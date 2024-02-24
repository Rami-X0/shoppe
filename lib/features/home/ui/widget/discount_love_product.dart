import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/di/dependency_injection.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_snack_bar.dart';
import 'package:shoppe/features/favorites/data/models/favorites_request.dart';
import 'package:shoppe/features/favorites/logic/favorites_cubit.dart';
import 'package:shoppe/features/favorites/logic/favorites_state.dart';
import 'package:shoppe/features/home/data/models/product_response.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';

class DiscountLoveProduct extends StatelessWidget {
  final ProductsResponse productsResponse;
  final int index;

  const DiscountLoveProduct({
    super.key,
    required this.productsResponse,
    required this.index,
  });

  final double radiusCircular = 15;

  final Color colorWidget = Colors.white70;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildDiscountLoveProduct(
          color: Colors.red,
          topRight: radiusCircular,
          bottomLeft: radiusCircular,
          child: Text(
            'Discount',
            style: TextStyles.font10WhiteBold,
          ),
        ),
        const Spacer(),
        _blocProviderAddFavorites()
      ],
    );
  }

  Widget _blocProviderAddFavorites() {
    return BlocProvider(
      create: (context) => getIt<FavoritesCubit>(),
      child: BlocConsumer<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          return InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              context.read<FavoritesCubit>().emitAddFavorites(
                    FavoritesRequest(
                      productId: productsResponse.data!.productData![index].id!,
                    ),
                  );
            },
            child: _buildDiscountLoveProduct(
              color: ColorsManager.mainBlue,
              topLeft: radiusCircular,
              bottomRight: radiusCircular,
              child: FaIcon(
                context.read<HomeCubit>().favorites[
                        productsResponse.data!.productData![index].id]!
                    ? FontAwesomeIcons.solidHeart
                    : FontAwesomeIcons.heart,
                color: Colors.white70,
                size: 20.w,
              ),
            ),
          );
        },
        listener: (context, state) {
          state.whenOrNull(successAddFavorites: (addFavorites) {
            appSnackBar(
              text: addFavorites.message.toString(),
              backGroundColor:
                  addFavorites.status == true ? Colors.green : Colors.red,
              context: context,
            );
          });
        },
      ),
    );
  }

  Widget _buildDiscountLoveProduct({
    required Color color,
    required Widget child,
    double? bottomLeft,
    double? topRight,
    double? topLeft,
    double? bottomRight,
  }) {
    return Container(
      width: 50.w,
      height: 35.h,
      decoration: BoxDecoration(
        color: color,
      border: Border.all(
        color: ColorsManager.moreLightGray,
        width: 1.5
      ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(bottomLeft ?? 0),
          topRight: Radius.circular(topRight ?? 0),
          topLeft: Radius.circular(topLeft ?? 0),
          bottomRight: Radius.circular(bottomRight ?? 0),

        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
