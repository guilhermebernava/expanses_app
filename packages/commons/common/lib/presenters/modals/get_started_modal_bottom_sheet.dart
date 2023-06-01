import 'package:common/common.dart';
import 'package:flutter/material.dart';

class GetStartedModalBottomSheet extends StatelessWidget {
  final Size size;
  final GoogleAuthUsecase googleAuthUsecase;
  final UserBloc userBloc;

  const GetStartedModalBottomSheet({
    super.key,
    required this.size,
    required this.googleAuthUsecase,
    required this.userBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey("GetStartedModalBottomSheet"),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      height: size.height * 0.35,
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
                  CommonButtonText(
                    width: size.width,
                    onTap: () async {
                      Navigator.pushNamed(context, AppRoutes.signUp);
                    },
                    text: "SIGN UP",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: CommonButtonText(
                      width: size.width,
                      onTap: () async {
                        Navigator.pop(context);
                        ShowModalBottomSheetServices.showSignIn(
                          context,
                          size,
                          googleAuthUsecase,
                          userBloc,
                        );
                      },
                      isReverseColor: true,
                      text: "SIGN IN",
                    ),
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
