import 'package:flutter/material.dart';
import 'package:common/common.dart';

class SocialLoginButtons extends StatelessWidget {
  final bool canPop;
  final Size size;

  const SocialLoginButtons({
    super.key,
    required this.canPop,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return canPop
        ? Container()
        : Column(
            children: [
              OrWidget(size: size),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialLoginButton(
                    color: AppColors.grey,
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
                      //TODO adicionar google login
                    },
                  ),
                ],
              )
            ],
          );
  }
}
