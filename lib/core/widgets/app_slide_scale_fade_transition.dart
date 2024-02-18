import 'package:flutter/material.dart';

class AppSlideScaleFadeTransition extends StatefulWidget {
  final Widget child;
  final double scaleOffsetEnd;

  const AppSlideScaleFadeTransition(
      {super.key, required this.child, required this.scaleOffsetEnd});

  @override
  State<AppSlideScaleFadeTransition> createState() =>
      _AppSlideScaleFadeTransitionState();
}

class _AppSlideScaleFadeTransitionState
    extends State<AppSlideScaleFadeTransition> with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _scaleWithFadeAnimation;
  late Animation<Offset> _slideAnimation;

  // late Animation<double> _fadeAnimation;
  Duration durationAnimation = const Duration(milliseconds: 1200);
  Curve curvesAnimation = Curves.easeInOutQuart;

  @override
  void initState() {
    super.initState();
    createScaleFadeAnimation();
    createSlideAnimation();
  }

  void createScaleFadeAnimation() {
    _controller = AnimationController(vsync: this, duration: durationAnimation)
      ..forward();
    _scaleWithFadeAnimation = Tween<double>(begin: 0.0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: curvesAnimation));
  }

  void createSlideAnimation() {
    _controller = AnimationController(vsync: this, duration: durationAnimation)
      ..forward();
    _slideAnimation = Tween<Offset>(
            begin: Offset(0, widget.scaleOffsetEnd), end: const Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: curvesAnimation));
  }


  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleWithFadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _scaleWithFadeAnimation,
          child: widget.child,
        ),
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    debugPrint('===========================================>>>>>');

    super.dispose();
  }

}
