import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../widgets/lottie_box.dart';

class InvestimentPage extends StatelessWidget {
  final Size size;
  const InvestimentPage({
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
            asset: AppAssets.investimentLottie,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "See How Much You Will Spend",
              textAlign: TextAlign.center,
              style: AppFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
          Text(
            "You can deduce how much you going to spend every month",
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
