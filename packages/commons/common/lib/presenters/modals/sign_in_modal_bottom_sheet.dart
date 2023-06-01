import 'package:common/common.dart';
import 'package:flutter/material.dart';

class SignInModalBottomSheet extends StatelessWidget {
  final Size size;
  final GoogleAuthUsecase googleAuthUsecase;
  final UserBloc userBloc;

  const SignInModalBottomSheet({
    super.key,
    required this.size,
    required this.googleAuthUsecase,
    required this.userBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey("SignInModalBottomSheet"),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(
            20,
          ),
        ),
      ),
      height: size.height * 0.45,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              height: 7,
              width: 70,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(
                  100,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: AppColors.mediumBlue,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CommonButtonText(
                    key: const ValueKey("SIGN_IN"),
                    width: size.width,
                    leading: const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.email,
                        size: 35,
                        color: AppColors.white,
                      ),
                    ),
                    onTap: () async =>
                        Navigator.pushNamed(context, AppRoutes.signIn),
                    text: "Sign In with Email",
                  ),
                  CommonButtonText.safeButton(
                    key: const ValueKey("GOOGLE"),
                    isReverseColor: true,
                    leading: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.asset(
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.alarm);
                        },
                        AppAssets.googleIcon,
                        width: 30,
                        height: 30,
                      ),
                    ),
                    width: size.width,
                    onTap: () async {
                      final result = await googleAuthUsecase();

                      if (result.isLeft() && context.mounted) {
                        return ShowErrorServices.showError(
                            context, result.left.message);
                      }

                      userBloc.add(Login(user: result.right));
                      if (context.mounted) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRoutes.home, (route) => false);
                      }
                    },
                    text: "Sign In with Google",
                  ),
                  CommonButtonText.safeButton(
                    key: const ValueKey("GITHUB"),
                    isReverseColor: true,
                    leading: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.asset(
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.alarm);
                        },
                        AppAssets.githubIcon,
                        width: 30,
                        height: 30,
                      ),
                    ),
                    width: size.width,
                    onTap: () async {
                      //TODO adicionar login com o GIT
                    },
                    text: "Sign In with Github",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
