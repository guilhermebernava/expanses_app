import 'package:common/common.dart';
import 'package:flutter/material.dart';

class TextAnimated extends StatefulWidget {
  const TextAnimated({super.key});

  @override
  State<TextAnimated> createState() => _TextAnimatedState();
}

class _TextAnimatedState extends State<TextAnimated>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation animation;
  late final Animation animation2;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    animation = Tween(begin: 30.0, end: 2.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.000,
          0.500,
          curve: Curves.ease,
        ),
      ),
    );

    animation2 = Tween(begin: 24.0, end: 42.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.500,
          1.000,
          curve: Curves.ease,
        ),
      ),
    );

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) => Text(
        "EXPENZIO",
        textAlign: TextAlign.center,
        style: AppFonts.montserrat(
          fontSize: animation2.value,
          fontWeight: FontWeight.bold,
          letterSpacing: animation.value,
        ),
      ),
    );
  }
}
