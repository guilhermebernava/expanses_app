import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/modules/sign_up/presenters/controllers/sign_up_page_controller.dart';
import 'package:login/modules/sign_up/presenters/widgets/sign_up_logo.dart';

class SignUpPage extends StatelessWidget {
  final SignUpPageController controller;
  const SignUpPage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: CommonPageAnimated(
        size: size,
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        body: CommonForm(
          formKey: controller.formKey,
          children: [
            const SignUpLogo(),
            Column(
              children: [
                CommonInput(
                  label: "E-mail",
                  onChanged: (val) => controller.model.email(val),
                  validator: (val) => controller.model.email.validator(),
                  hintLabel: "yourname@example.com",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                ),
                CommonInput(
                  textInputAction: TextInputAction.next,
                  onChanged: (val) => controller.model.password(val),
                  validator: (val) => controller.model.password.validator(),
                  label: "Password",
                  isPassword: true,
                  hintLabel: "yourpassword",
                ),
                CommonInput(
                  textInputAction: TextInputAction.next,
                  onChanged: (val) => controller.model.password(val),
                  validator: (val) => controller.model.password.validator(),
                  label: "Password2",
                  isPassword: true,
                  hintLabel: "yourpassword",
                ),
                CommonInput(
                  textInputAction: TextInputAction.next,
                  onChanged: (val) => controller.model.password(val),
                  validator: (val) => controller.model.password.validator(),
                  label: "Password3",
                  isPassword: true,
                  hintLabel: "yourpassword",
                ),
                CommonInput(
                  textInputAction: TextInputAction.done,
                  onChanged: (val) => controller.model.confirmPassword(val),
                  validator: (val) =>
                      controller.model.confirmPassword.validator(),
                  label: "Confirm Password",
                  isPassword: true,
                  hintLabel: "yourpassword",
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: size.height * 0.1),
              child: CommonButtonText.safeButton(
                key: const ValueKey("SIGN_UP"),
                width: size.width,
                onTap: () async => await controller.signUp(context),
                text: "SIGN UP",
              ),
            )
          ],
        ),
      ),
    );
  }
}
