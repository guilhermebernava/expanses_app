import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:login/modules/login/presenters/models/login_model.dart';

class LoginPageController {
  final EmailAuthUsecase emailAuthUsecase;
  final formKey = GlobalKey<FormState>();
  final model = LoginModel();

  LoginPageController({
    required this.emailAuthUsecase,
  });

  Future<void> login(BuildContext context) async {
    if (!validateForm()) {
      return;
    }

    await emailAuthUsecase(
        LoginDto(email: model.email.value, password: model.password.value));
  }

  bool validateForm() {
    final formState = formKey.currentState;

    if (formState == null) {
      return false;
    }

    if (!formState.validate()) {
      return false;
    }

    return true;
  }
}
