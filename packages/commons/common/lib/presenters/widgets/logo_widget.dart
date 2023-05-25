import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 60, right: 120),
            child: Container(height: 2.5, color: AppColors.white),
          ),
        ),
        Text(
          "EXPENZIO",
          textAlign: TextAlign.center,
          style: AppFonts.montserrat(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 120, right: 60),
            child: Container(height: 2.5, color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
