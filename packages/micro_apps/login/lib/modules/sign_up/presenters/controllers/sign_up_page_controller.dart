import 'package:flutter/material.dart';
import 'package:common/common.dart';

class SignUpPageController {
  final formKey = GlobalKey<FormState>();
  //TODO adicionar usecase para SIGN_UP

  Future<void> signUp(BuildContext context) async {
    //TODO adicionar validacao do FORM

    if (context.mounted) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
    }
  }
}
