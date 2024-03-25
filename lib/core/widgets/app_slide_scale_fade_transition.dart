import 'package:flutter/material.dart';

class AppSlideScaleFadeTransition extends StatefulWidget {
  final Widget child;
  final double scaleOffsetEnd;
  final int? duration;
  final bool animate;

  const AppSlideScaleFadeTransition({
    super.key,
    required this.child,
    required this.scaleOffsetEnd,
    this.duration,
    this.animate=true ,
  });

  @override
  State<AppSlideScaleFadeTransition> createState() =>
      _AppSlideScaleFadeTransitionState();
}

class _AppSlideScaleFadeTransitionState
    extends State<AppSlideScaleFadeTransition>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  late AnimationController _controller;
  late Animation<double> _scaleWithFadeAnimation;
  late Animation<Offset> _slideAnimation;

  Duration durationAnimation = const Duration(milliseconds: 1350);
  Curve curvesAnimation = Curves.ease;

  @override
  void initState() {
    super.initState();
    createScaleFadeAnimation();
    createSlideAnimation();

  }
void checkWorkAnimation(){
  if(widget.animate==true){
    _controller.forward();
  }
}
  void createScaleFadeAnimation() {
    _controller = AnimationController(
        vsync: this,
        duration: widget.duration != null
            ? Duration(milliseconds: widget.duration!)
            : durationAnimation);
    _scaleWithFadeAnimation = Tween<double>(begin: 0.0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: curvesAnimation));
    checkWorkAnimation();
  }

  void createSlideAnimation() {
    _controller = AnimationController(
        vsync: this,
        duration: widget.duration != null
            ? Duration(milliseconds: widget.duration!)
            : durationAnimation);
    _slideAnimation = Tween<Offset>(
            begin: Offset(0, widget.scaleOffsetEnd), end: const Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: curvesAnimation));
    checkWorkAnimation();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
    debugPrint('========>>>>>Dispose Animation');
    super.dispose();
  }
}
