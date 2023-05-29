import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/modules/login/presenters/widgets/social_login_buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
        body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const LogoWidget(),
              Column(
                children: [
                  const CommonInput(
                    label: "E-mail",
                    hintLabel: "yourname@example.com",
                    textInputType: TextInputType.emailAddress,
                  ),
                  CommonInput(
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
              CommonButton(
                width: size.width,
                onTap: () {},
                text: "SIGN IN",
              ),
              SocialLoginButtons(
                canPop: canPop,
                size: size,
              )
            ],
          ),
        ),
      ),
    );
  }
}
