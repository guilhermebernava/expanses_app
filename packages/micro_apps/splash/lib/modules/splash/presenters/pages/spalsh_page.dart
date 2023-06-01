import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:splash/modules/splash/domain/use_cases/first_time_app/first_time_app_usecase.dart';
import 'package:splash/modules/splash/domain/use_cases/get_user/get_user_usecase.dart';

import '../controllers/splash_controller.dart';
import '../widgets/line_animation.dart';
import '../widgets/text_animated.dart';

class SplashPage extends StatefulWidget {
  final FirstTimeAppUseCase firstTimeAppUseCase;
  final GetUserUsecase getUserUsecase;
  final UserBloc userBloc;

  const SplashPage({
    super.key,
    required this.firstTimeAppUseCase,
    required this.getUserUsecase,
    required this.userBloc,
  });

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
    _controller = SplashController(
      firstTimeAppUseCase: widget.firstTimeAppUseCase,
      getUserUsecase: widget.getUserUsecase,
      userBloc: widget.userBloc,
    );
    _controller.redirect(context);
    _startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: AnimatedOpacity(
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
    );
  }
}
