import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widgets/app_snack_bar.dart';
import 'package:shoppe/features/favorites/logic/favorites_cubit.dart';
import 'package:shoppe/features/favorites/logic/favorites_state.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';

class ButtonFavoriteHome extends StatelessWidget {
  final num productId;
  final Color? favoriteIconColor;

  const ButtonFavoriteHome({
    super.key,
    required this.productId,
    this.favoriteIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
        buildWhen: (previous, current) =>
            current is LoadingAddFavorites || current is SuccessAddFavorites,
        builder: (context, state) {
          return context.read<HomeCubit>().favorites[productId]!
              ? FaIcon(
                  FontAwesomeIcons.solidHeart,
                  color: favoriteIconColor,
                  size: 22.w,
                )
              : FaIcon(
                  FontAwesomeIcons.heart,
                  color: favoriteIconColor,
                  size: 20.w,
                );
        },
        listener: (context, state) {
          state.whenOrNull(
            successAddFavorites: (data) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              appSnackBar(
                text: data.message.toString(),
                backGroundColor:
                    data.status! ? ColorsManager.darkBlue : Colors.red,
                context: context,
              );
              Future.delayed(
                const Duration(milliseconds: 1500),
                () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              );
            },
          );
        });
  }
}
