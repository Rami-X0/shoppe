import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/widgets/app_slide_scale_fade_transition.dart';
import 'package:shoppe/features/favorites/data/models/favorites_request.dart';
import 'package:shoppe/features/favorites/data/models/favorites_response.dart';
import 'package:shoppe/features/favorites/logic/favorites_cubit.dart';
import 'package:shoppe/features/favorites/ui/widgets/favorites_view_item.dart';

class FavoritesView extends StatefulWidget {
  final FavoritesResponse favoritesResponse;

  const FavoritesView({super.key, required this.favoritesResponse});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
late bool animateInitial;

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    super.initState();
    _startInitialAnimation();
  }

  void _startInitialAnimation() {
    setState(() {
      animateInitial = true;
    });
    Future.delayed(const Duration(milliseconds: 1400), () {
      setState(() {
        animateInitial = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      shrinkWrap: true,
      initialItemCount: widget.favoritesResponse.favoritesData!.data!.length,
      itemBuilder: (context, index, animation) {
        return animateInitial
            ? AppSlideScaleFadeTransition(
                scaleOffsetEnd: 3,
                animate: animateInitial,
                child: FavoritesViewItem(
                  onTap: () => addProductFavorites(context, index),
                  favoritesResponse: widget.favoritesResponse,
                  index: index,
                ),
              )
            : FavoritesViewItem(
                onTap: () => addProductFavorites(context, index),
                favoritesResponse: widget.favoritesResponse,
                index: index,
              );
      },
    );
  }

  void _removeItem(int index) {
    _listKey.currentState!.removeItem(
      index,
      (context, Animation<double> animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: FavoritesViewItem(
            favoritesResponse: widget.favoritesResponse,
            index: index,
          ),
        );
      },
      duration: const Duration(milliseconds: 400),
    );
    checkRemoveLastItemDuration(index);
  }

  void checkRemoveLastItemDuration(int index) {
    var favoritesData = widget.favoritesResponse.favoritesData!.data!;

    bool isLastItem = index == favoritesData.length - 1;
    if (!isLastItem) {
      favoritesData.removeAt(index);
    } else {
      Future.delayed(
        const Duration(milliseconds: 600),
        () {
          favoritesData.removeAt(index);
        },
      );
    }
  }

  void addProductFavorites(BuildContext context, int index) {
    context
        .read<FavoritesCubit>()
        .emitAddFavorites(FavoritesRequest(
            productId: widget
                .favoritesResponse.favoritesData!.data![index].product!.id!))
        .then((value) => _removeItem(index));
  }
}
