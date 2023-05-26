import 'package:common/common.dart';
import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final Size size;
  final String image;
  final VoidCallback onTap;
  final Color color;

  const SocialLoginButton({
    super.key,
    required this.image,
    required this.size,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(1000),
        color: color,
        child: InkWell(
          enableFeedback: false,
          splashColor: AppColors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(1000),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              image,
              width: 50,
              height: 50,
            ),
          ),
        ),
      ),
    );
  }
}
