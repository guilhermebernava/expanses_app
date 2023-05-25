import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:splash/modules/get_started/presenters/widgets/modal_bottom_sheet/or_widget.dart';

import '../social_login_button.dart';

class GetStartedModalBottomSheet extends StatelessWidget {
  final Size size;
  const GetStartedModalBottomSheet({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppAssets.backgroundBlue,
          ),
          fit: BoxFit.fitHeight,
          opacity: 0.7,
        ),
      ),
      height: size.height * 0.5955,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            color: AppColors.darkBlue,
            width: double.infinity,
            height: size.height * 0.51,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                CommonButton(
                  width: size.width,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/sign-up");
                  },
                  text: "Sign Up",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CommonButton(
                    width: size.width,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/login");
                    },
                    isReverseColor: true,
                    text: "Sign In",
                  ),
                ),
                OrWidget(size: size),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SocialLoginButton(
                      image: AppAssets.googleIcon,
                      size: size,
                      onTap: () {
                        Navigator.pop(context);
                        //TODO implementar login com o google
                      },
                    ),
                    SocialLoginButton(
                      image: AppAssets.githubIcon,
                      size: size,
                      onTap: () {
                        Navigator.pop(context);
                        //TODO implementar login com o github
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
