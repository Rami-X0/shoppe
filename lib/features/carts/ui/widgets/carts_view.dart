import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/widgets/app_slide_scale_fade_transition.dart';
import 'package:shoppe/features/carts/data/models/carts_request.dart';
import 'package:shoppe/features/carts/data/models/carts_response.dart';
import 'package:shoppe/features/carts/logic/carts_cubit.dart';
import 'package:shoppe/features/carts/ui/widgets/carts_view_item.dart';

class CartsView extends StatefulWidget {
  final CartsResponse cartsResponse;

  const CartsView({
    super.key,
    required this.cartsResponse,
  });

  @override
  State<CartsView> createState() => _CartsViewState();
}

final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
late bool animateInitial;

class _CartsViewState extends State<CartsView> {
  @override
  void initState() {
    super.initState();
    _startInitialAnimation();
  }

  void _startInitialAnimation() {
    setState(() {
      animateInitial = true;
    });
    Future.delayed(
      const Duration(milliseconds: 1400),
      () {
        setState(() {
          animateInitial = false;
        });
      },
    );
  }

  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      shrinkWrap: true,
      initialItemCount: widget.cartsResponse.cartsData!.data!.length,
      itemBuilder: (context, index, animation) {
        return animateInitial
            ? AppSlideScaleFadeTransition(
                scaleOffsetEnd: 3,
                animate: animateInitial,
                child: CartsViewItem(
                  onTap: () => addProductCarts(context, index),
                  cartsResponse: widget.cartsResponse,
                  index: index,
                ),
              )
            : CartsViewItem(
                onTap: () => addProductCarts(context, index),
                cartsResponse: widget.cartsResponse,
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
          child: CartsViewItem(
            cartsResponse: widget.cartsResponse,
            index: index,
          ),
        );
      },
      duration: const Duration(milliseconds: 400),
    );
    checkRemoveLastItemDuration(index);
  }

  void checkRemoveLastItemDuration(int index) {
    var cartsData = widget.cartsResponse.cartsData!.data!;

    bool isLastItem = index == cartsData.length - 1;
    if (!isLastItem) {
      cartsData.removeAt(index);
    } else {
      Future.delayed(
        const Duration(milliseconds: 600),
        () {
          cartsData.removeAt(index);
        },
      );
    }
  }

  void addProductCarts(BuildContext context, int index) {
    context
        .read<CartsCubit>()
        .emitAddCarts(CartsRequest(
            productId:
                widget.cartsResponse.cartsData!.data![index].product!.id!))
        .then((value) => _removeItem(index));
  }
}
