import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/favorites/logic/favorites_cubit.dart';
import 'package:shoppe/features/favorites/logic/favorites_state.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritesButton extends StatelessWidget {
  final num productId;
  final VoidCallback? onTap;

  const FavoritesButton({
    super.key,
    required this.productId, required this.onTap,
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
            onTap:onTap,
            child: context.read<HomeCubit>().favorites[productId]!
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
        FontAwesomeIcons.solidHeart,
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
}
