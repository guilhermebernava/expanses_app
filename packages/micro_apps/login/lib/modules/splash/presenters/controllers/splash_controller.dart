import 'package:common/presenters/pages/error_page.dart';
import 'package:login/modules/splash/domain/use_cases/first_time_app_usecase.dart';
import 'package:flutter/material.dart';

class SplashController {
  final FirstTimeAppUseCase firstTimeAppUseCase;
  final _login = "/login";
  final _getStarted = "/get-started";
  // final _home = "/home";

  SplashController({required this.firstTimeAppUseCase});

  void redirect(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000)).then((value) {
      firstTimeAppUseCase.isFirstTime().then((value) {
        if (value.isLeft()) {
          return Navigator.of(context).pushNamed(
            ErrorPage.route,
            arguments: value.left,
          );
        }

        //TODO adicionar validação de usuário logado
        if (value.right) {
          return Navigator.of(context).pushNamed(_getStarted);
        }
        return Navigator.of(context).pushNamed(_login);
      });
    });
  }
}
