import 'package:common/common.dart';
import 'package:flutter/material.dart';
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

  Future<void> recoverPassword(BuildContext context, Size size) async {
    final result = await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        elevation: 1,
        insetPadding: const EdgeInsets.all(20),
        actionsAlignment: MainAxisAlignment.center,
        backgroundColor: AppColors.darkBlue,
        title: Center(
          child: Text(
            'Password Recovery',
            style: AppFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        content: SizedBox(
          height: size.height * 0.2,
          width: size.width,
          child: CommonForm(
            formKey: _secondFormKey,
            children: [
              CommonInput(
                label: "E-mail",
                onChanged: (val) => _recoverEmail(val),
                validator: (val) => _recoverEmail.validator(),
                textInputAction: TextInputAction.done,
                hintLabel: "email@example.com",
              )
            ],
          ),
        ),
        actions: [
          CommonButtonText.safeButton(
            width: size.width,
            onTap: () async {
              if (!FormValidations.validateForm(_secondFormKey)) {
                return;
              }

              final result = await recoverPasswordUsecase(_recoverEmail.value);

              if (result.isLeft() && context.mounted) {
                ShowErrorServices.showError(context, result.left.message);
                return;
              }
              if (context.mounted) {
                return Navigator.pop(context);
              }
            },
            text: "RECOVER",
          ),
          const SizedBox(
            height: 30,
          ),
          CommonTextButton(
            text: "CLOSE",
            fontSize: 18,
            onTap: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );

    if (result != null && context.mounted) {
      return ShowErrorServices.showError(context, result);
    }
  }

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
