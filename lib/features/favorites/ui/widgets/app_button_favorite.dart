import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/favorites/data/models/favorites_request.dart';
import 'package:shoppe/features/favorites/logic/favorites_cubit.dart';
import 'package:shoppe/features/favorites/logic/favorites_state.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';

class AppButtonFavorite extends StatelessWidget {
  final num productId;

  const AppButtonFavorite({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      buildWhen: (previous, current) =>
          current is LoadingAddFavorites || current is SuccessAddFavorites,
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
              addProductFavorites(context);
            },
            child: context.read<HomeCubit>().favorites[productId]!
                ? Center(
              child: FaIcon(
                context.read<HomeCubit>().favorites[productId]!
                    ? FontAwesomeIcons.solidHeart
                    : FontAwesomeIcons.heart,
                color: ColorsManager.mainBlue,
                size: 20.w,
              ),
            )
                : Center(
              child: Text(
                'Wait...',
                style: TextStyles.font14MainBlueBold.copyWith(
                  fontSize: 11.sp,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void addProductFavorites(BuildContext context) {
    context
        .read<FavoritesCubit>()
        .emitAddFavorites(FavoritesRequest(productId: productId));
  }
}
