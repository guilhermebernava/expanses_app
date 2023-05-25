import 'package:flutter/material.dart';

class MovingAnimation extends StatefulWidget {
  final Widget child;
  final Offset fromWhere;
  final Duration delay;

  const MovingAnimation({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.fromWhere = const Offset(0, 1),
  });

  @override
  State<MovingAnimation> createState() => _MovingAnimationState();
}

class _MovingAnimationState extends State<MovingAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    animation = Tween(
      begin: widget.fromWhere,
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutCubic,
      ),
    );

    Future.delayed(widget.delay, () {
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: widget.child,
    );
  }
}
