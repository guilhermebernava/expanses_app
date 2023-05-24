import 'package:common/common.dart';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:login/modules/splash/presenters/controllers/splash_controller.dart';
import 'package:login/modules/splash/presenters/widgets/line_animation.dart';
import 'package:login/modules/splash/presenters/widgets/text_animated.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashController _controller;
  bool animated = false;

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        if (mounted) {
          animated = true;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = SplashController(firstTimeAppUseCase: GetIt.instance.get());
    _controller.redirect(context);
    _startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: AbstractBackground(
        size: size,
        opacity: 0.05,
        children: [
          AnimatedOpacity(
            opacity: animated ? 1 : 1,
            duration: const Duration(milliseconds: 500),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LineAnimationWidget(isReverse: true),
                TextAnimated(),
                LineAnimationWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
