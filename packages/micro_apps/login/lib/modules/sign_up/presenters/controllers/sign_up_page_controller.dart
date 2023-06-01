import 'package:flutter/material.dart';
import 'package:common/common.dart';
import 'package:login/modules/sign_up/presenters/models/sign_up_model.dart';

class SignUpPageController {
  final formKey = GlobalKey<FormState>();
  final SignUpUsecase signUpUsecase;
  final model = SignUpModel();

  SignUpPageController({required this.signUpUsecase});

  Future<void> signUp(BuildContext context) async {
    if (!FormValidations.validateForm(formKey) &&
        model.password.value == model.confirmPassword.value) {
      return;
    }

    final signUp = await signUpUsecase(
        SignUpDto(email: model.email.value, password: model.password.value));

    if (signUp.isLeft() && context.mounted) {
      return ShowErrorServices.showError(context, signUp.left.message);
    }

    if (context.mounted) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
    }
  }
}
