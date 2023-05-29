import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:splash/modules/splash/domain/use_cases/first_time_app/first_time_app_usecase.dart';
import 'package:splash/modules/splash/domain/use_cases/get_user/get_user_usecase.dart';

class SplashController {
  final FirstTimeAppUseCase firstTimeAppUseCase;
  final GetUserUsecase getUserUsecase;

  final _login = "/login";
  final _getStarted = "/get-started";
  final _home = "/home";

  SplashController({
    required this.firstTimeAppUseCase,
    required this.getUserUsecase,
  });

  Future<void> redirect(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 2000));

    final isFirstTime = await firstTimeAppUseCase.isFirstTime();

    if (isFirstTime.isLeft() && context.mounted) {
      return ShowErrorServices.showError(context, isFirstTime.left);
    }

    if (isFirstTime.right && context.mounted) {
      Navigator.of(context).pushReplacementNamed(_getStarted);
      return;
    }

    final existUser = await getUserUsecase();

    if (existUser == null && context.mounted) {
      Navigator.of(context).pushReplacementNamed(_home);
    }

    debugPrint("EXIST USER ERROR: $existUser");

    if (context.mounted) {
      Navigator.of(context).pushReplacementNamed(_login);
      return;
    }
  }
}
