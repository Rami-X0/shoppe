import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/features/favorites/data/models/favorites_request.dart';
import 'package:shoppe/features/favorites/logic/favorites_cubit.dart';
import 'package:shoppe/features/favorites/logic/favorites_state.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';

class AppButtonFavoriteHome extends StatelessWidget {
  final num productId;
  final Color? favoriteIconColor;

  const AppButtonFavoriteHome({
    super.key,
    required this.productId,
    this.favoriteIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      buildWhen: (previous, current) =>
          current is LoadingAddFavorites || current is SuccessAddFavorites,
      builder: (context, state) {
        return GestureDetector(
          onTap:(){
            addProductFavorites(context);

          } ,
          child: FaIcon(
            context.read<HomeCubit>().favorites[productId]!
                ? FontAwesomeIcons.solidHeart
                : FontAwesomeIcons.heart,
            color: favoriteIconColor,
            size: 20.w,
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
