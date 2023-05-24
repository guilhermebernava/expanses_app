import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:login/modules/login/presenters/widgets/login_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      //TODO terminar de desenvolver pagina de login
      body: AbstractBackground(
        opacity: 0.05,
        size: size,
        children: [
          SizedBox(
            width: size.width,
            height: size.height * 0.9,
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    Text(
                      "esqueceu sua senha ? ",
                      style: AppFonts.montserrat(),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 200,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.purple,
                        ),
                        child: Center(
                          child: Text(
                            "Sign in".toUpperCase(),
                            style: AppFonts.montserrat(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          color: AppColors.white,
                          child: const Icon(
                            Icons.face,
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          color: AppColors.white,
                          child: const Icon(
                            Icons.line_axis,
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          color: AppColors.white,
                          child: const Icon(
                            Icons.abc,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
