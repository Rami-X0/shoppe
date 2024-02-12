import 'package:flutter/material.dart';

class AppSizeTransitionRouter extends PageRouteBuilder {

  final Widget child;

  AppSizeTransitionRouter(
    this.child,
  ) : super(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) => child,
          barrierColor: Colors.white30,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curvedTransition =
                CurvedAnimation(parent: animation, curve: Curves.easeInOut);
            final sizeTransitionCurve =
                Tween<double>(begin: 0, end: 1).animate(curvedTransition);

            return Align(
              alignment: Alignment.center,
              child: SizeTransition(
                sizeFactor: sizeTransitionCurve,
                axis: Axis.horizontal,
                child: child,
              ),
            );
          },
        );
}
