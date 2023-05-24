import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/modules/login/presenters/widgets/login_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        //TODO terminar de desenvolver pagina de login
        body: AbstractBackground(
          opacity: 0.05,
          size: size,
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const TransparentAppBarWidget(),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Column(
                            children: [
                              LoginInput(
                                label: "E-mail",
                                hintLabel: "yourname@example.com",
                                textInputType: TextInputType.emailAddress,
                              ),
                              LoginInput(
                                label: "Password",
                                isPassword: true,
                                hintLabel: "yourpassword",
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          CommonButton(
                            width: size.width,
                            onTap: () {},
                            text: "SIGN IN",
                          )
                        ],
                      ),
                    ),
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
