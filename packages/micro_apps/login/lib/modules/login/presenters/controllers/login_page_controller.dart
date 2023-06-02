import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:login/modules/login/presenters/dialogs/recover_password_dialog.dart';
import 'package:login/modules/login/presenters/models/login_model.dart';

class LoginPageController {
  final EmailAuthUsecase emailAuthUsecase;
  final RecoverPasswordUsecase recoverPasswordUsecase;
  final UserBloc userBloc;
  final formKey = GlobalKey<FormState>();
  final model = LoginModel();

  final _secondFormKey = GlobalKey<FormState>();
  final _recoverEmail = Email("");

  LoginPageController({
    required this.emailAuthUsecase,
    required this.recoverPasswordUsecase,
    required this.userBloc,
  });

  void recoverPassword(BuildContext context, Size size) => showDialog(
        context: context,
        builder: (_) => RecoverPasswordDialog(
          size: size,
          recoverEmail: _recoverEmail,
          formKey: _secondFormKey,
          recoverPasswordUsecase: recoverPasswordUsecase,
        ),
      );

  Future<void> login(BuildContext context) async {
    if (!FormValidations.validateForm(formKey)) {
      return;
    }

    final result = await emailAuthUsecase(
        LoginDto(email: model.email.value, password: model.password.value));

    if (result.isLeft() && context.mounted) {
      return ShowErrorServices.showError(context, result.left.message);
    }
    userBloc.add(Login(user: result.right));

    if (context.mounted) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
    }
  }
}
