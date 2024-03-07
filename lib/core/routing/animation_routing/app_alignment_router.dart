import 'package:flutter/material.dart';

class AppAlignmentRouter extends PageRouteBuilder {
  final Widget child;
  AppAlignmentRouter(this.child,) : super(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    barrierColor: Colors.white30,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedTransition =
      CurvedAnimation(parent: animation, curve: Curves.easeInOut);
      final tweenAnimation = Tween(
          begin: const Offset(0.0, 1.0), end: Offset.zero)
          .animate(curvedTransition);

      return SlideTransition(
        position: tweenAnimation,
        child: child,
      );
    },
  );
}
