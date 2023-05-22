import 'package:expenzio/modules/splash/presenters/controllers/splash_controller.dart';
import 'package:expenzio/modules/splash/presenters/widgets/line_animation.dart';
import 'package:expenzio/modules/splash/presenters/widgets/text_animated.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashController _controller;
  bool animated = false;

  @override
  void initState() {
    super.initState();
    _controller = SplashController();
    _controller.redirect(context);
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (mounted) {
          animated = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D1E25),
      body: AnimatedOpacity(
        opacity: animated ? 1 : 1,
        duration: const Duration(milliseconds: 500),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LineAnimationWidget(
              isReverse: true,
            ),
            TextAnimated(),
            LineAnimationWidget(),
          ],
        ),
      ),
    );
  }
}
