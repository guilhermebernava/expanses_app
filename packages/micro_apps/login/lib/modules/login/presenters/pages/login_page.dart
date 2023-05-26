import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/modules/login/presenters/widgets/login_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //TODO terminar de desenvolver pagina de login

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: CommonPageAnimated(
        size: size,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const LogoWidget(),
              Column(
                children: [
                  const LoginInput(
                    label: "E-mail",
                    hintLabel: "yourname@example.com",
                    textInputType: TextInputType.emailAddress,
                  ),
                  LoginInput(
                    label: "Password",
                    isPassword: true,
                    hintLabel: "yourpassword",
                    counterLabel: "forgot your password ?",
                    onCounterTap: () {
                      //TODO implementar recuperar senha
                    },
                  ),
                ],
              ),
              const SizedBox(height: 0),
              CommonButton(
                width: size.width,
                onTap: () {},
                text: "SIGN IN",
              )
            ],
          ),
        ),
      ),
    );
  }
}
