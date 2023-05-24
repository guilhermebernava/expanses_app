import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:splash/modules/get_started/presenters/widgets/lottie_box.dart';

class ControlExpansesPage extends StatelessWidget {
  final Size size;
  const ControlExpansesPage({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBox(
            asset: 'packages/micro_apps/splash/assets/money_animation.json',
            size: size,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "Control All Your Expanses",
              textAlign: TextAlign.center,
              style: AppFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
          Text(
            "You can input all your expanses and make then monthly",
            textAlign: TextAlign.center,
            style: AppFonts.montserrat(
              fontSize: 16,
              color: AppColors.white,
            ),
          )
        ],
      ),
    );
  }
}
