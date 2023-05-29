import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:splash/modules/get_started/domain/usecases/google_auth/google_auth_usecase.dart';

class GetStartedModalBottomSheet extends StatelessWidget {
  final Size size;
  final GoogleAuthUsecase googleAuthUsecase;
  const GetStartedModalBottomSheet({
    super.key,
    required this.size,
    required this.googleAuthUsecase,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey("GetStartedModalBottomSheet"),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      height: size.height * 0.6,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonButton(
                    width: size.width,
                    onTap: () {
                      Navigator.pushNamed(context, "/sign-up");
                    },
                    text: "Sign Up",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: CommonButton(
                      width: size.width,
                      onTap: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      isReverseColor: true,
                      text: "Sign In",
                    ),
                  ),
                  OrWidget(size: size),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialLoginButton(
                        color: AppColors.black,
                        image: AppAssets.githubIcon,
                        size: size,
                        onTap: () async {
                          //TODO implementar login com  o github
                        },
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      SocialLoginButton(
                        color: AppColors.white,
                        image: AppAssets.googleIcon,
                        size: size,
                        onTap: () async {
                          await googleAuthUsecase(context);
                        },
                      ),
                    ],
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
