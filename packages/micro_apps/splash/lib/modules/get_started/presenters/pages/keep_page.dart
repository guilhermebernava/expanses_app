import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:splash/design/app_assets.dart';

import '../widgets/lottie_box.dart';

class KeepPage extends StatelessWidget {
  final Size size;
  const KeepPage({
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
            size: size,
            asset: AppAssets.keepLottie,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "See How Can You Organize Your Money",
              textAlign: TextAlign.center,
              style: AppFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
          Text(
            "You can organize your life costs, create reminders to save money",
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
