import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  final GoogleAuthUsecase googleAuthUsecase;
  const LoginPage({
    super.key,
    required this.googleAuthUsecase,
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const LogoWidget(),
            SizedBox(height: canPop ? 30 : 0),
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const Column(
                    children: [
                      CommonInput(
                        label: "E-mail",
                        hintLabel: "yourname@example.com",
                        textInputType: TextInputType.emailAddress,
                      ),
                      CommonInput(
                        label: "Password",
                        isPassword: true,
                        hintLabel: "yourpassword",
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    child: CommonButtonText.safeButton(
                      width: size.width,
                      onTap: () async {},
                      text: "SIGN IN",
                    ),
                  ),
                  CommonTextButton(
                    text: "Forgot your password ?",
                    onTap: () {
                      //TODO implementar recuperar senha
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
