import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:splash/modules/splash/domain/use_cases/first_time_app/first_time_app_usecase.dart';
import 'package:splash/modules/splash/domain/use_cases/get_user/get_user_usecase.dart';

class SplashController {
  final FirstTimeAppUseCase firstTimeAppUseCase;
  final GetUserUsecase getUserUsecase;
  final UserBloc userBloc;

  SplashController({
    required this.firstTimeAppUseCase,
    required this.getUserUsecase,
    required this.userBloc,
  });

  Future<void> redirect(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 2000));

    final isFirstTime = await firstTimeAppUseCase.isFirstTime();

    if (isFirstTime.isLeft() && context.mounted) {
      return ShowErrorServices.showError(context, isFirstTime.left);
    }

    if (isFirstTime.right && context.mounted) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.getStarted, (_) => false);
      return;
    }

    final existUser = await getUserUsecase();

    if (existUser.isRight() && context.mounted) {
      userBloc.add(Login(user: existUser.right));
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.home, (_) => false);
      return;
    }

    debugPrint("EXIST USER ERROR: $existUser");

    if (context.mounted) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.choiceSign, (_) => false);
      return;
    }
  }
}
