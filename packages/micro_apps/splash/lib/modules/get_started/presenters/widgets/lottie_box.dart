import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

class LottieBox extends StatelessWidget {
  final Size size;
  final String asset;
  const LottieBox({
    super.key,
    required this.size,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.4,
      child: Lottie.asset(
        asset,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
