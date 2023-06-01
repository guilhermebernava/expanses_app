import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/modules/login/presenters/controllers/login_page_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginPageController controller;

  const LoginPage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final canPop = Navigator.canPop(context);

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: CommonPageAnimated(
        canPopUp: canPop,
        size: size,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        body: CommonForm(
          formKey: controller.formKey,
          padding: EdgeInsets.zero,
          children: [
            const LogoWidget(),
            SizedBox(height: canPop ? 30 : 0),
            Column(
              children: [
                CommonInput(
                  label: "E-mail",
                  onChanged: (val) => controller.model.email(val),
                  validator: (val) => controller.model.email.validator(),
                  hintLabel: "yourname@example.com",
                  textInputType: TextInputType.emailAddress,
                ),
                CommonInput(
                  label: "Password",
                  onChanged: (val) => controller.model.password(val),
                  validator: (val) => controller.model.password.validator(),
                  isPassword: true,
                  hintLabel: "yourpassword",
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: CommonButtonText.safeButton(
                key: const ValueKey("SIGN_IN"),
                width: size.width,
                onTap: () async {
                  await controller.login(context);
                },
                text: "SIGN IN",
              ),
            ),
            CommonTextButton(
              text: "Forgot your password ?",
              onTap: () {
                //TODO implementar recuperar senha
              },
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
