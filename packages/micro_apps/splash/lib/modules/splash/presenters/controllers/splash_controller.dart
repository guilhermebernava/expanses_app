import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../domain/use_cases/first_time_app_usecase.dart';

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
          ShowErrorServices.showError(context, value.left);
          return null;
        }

        //TODO adicionar validação de usuário logado
        if (value.right) {
          return Navigator.of(context).pushNamed(_getStarted);
        }
        return Navigator.of(context).pushNamed(_getStarted);
      });
    });
  }
}
