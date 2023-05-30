import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/modules/sign_up/presenters/widgets/sign_up_logo.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //TODO terminar de desenvolver pagina de sign_up

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: CommonPageAnimated(
        size: size,
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SignUpLogo(),
                const Column(
                  children: [
                    CommonInput(
                      label: "Full Name",
                      hintLabel: "name example",
                      textInputType: TextInputType.name,
                    ),
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
                    CommonInput(
                      label: "Confirm Password",
                      isPassword: true,
                      hintLabel: "yourpassword",
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: CommonButtonText.safeButton(
                    width: size.width,
                    onTap: () async {},
                    text: "SIGN UP",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
