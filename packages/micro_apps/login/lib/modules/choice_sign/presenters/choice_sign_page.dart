import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ChoiceSignPage extends StatelessWidget {
  final GoogleAuthUsecase googleAuthUsecase;

  const ChoiceSignPage({
    super.key,
    required this.googleAuthUsecase,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const double borderRadius = 100;

    return Scaffold(
      backgroundColor: AppColors.mediumBlue,
      body: Stack(
        children: [
          MovingAnimation(
            fromWhere: const Offset(0, -1),
            child: Container(
              height: size.height * 0.62,
              width: size.width,
              decoration: BoxDecoration(
                color: AppColors.mediumBlue,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.5),
                    blurRadius: 15,
                    spreadRadius: 10,
                  )
                ],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(borderRadius),
                  bottomRight: Radius.circular(borderRadius),
                ),
                image: DecorationImage(
                  image: const AssetImage(
                    AppAssets.backgroundBlue,
                  ),
                  onError: (exception, stackTrace) {},
                  fit: BoxFit.cover,
                  opacity: 0.63,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.45),
                child: const LogoWidget(),
              ),
            ),
          ),
          Container(
            padding:
                EdgeInsets.only(left: 40, top: size.height * 0.38, right: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.3),
                MovingAnimation(
                  child: Column(
                    children: [
                      Text(
                        "An App to you control all your finances and expanses",
                        textAlign: TextAlign.center,
                        style: AppFonts.montserrat(),
                      ),
                      SizedBox(height: size.height * 0.05),
                      CommonButtonText(
                        width: double.infinity,
                        onTap: () async {
                          ShowModalBottomSheetServices.showGetStarted(
                              context, size, googleAuthUsecase);
                        },
                        text: "Let's Start",
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
