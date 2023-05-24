import 'package:common/common.dart';
import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final Size size;
  final String image;
  final VoidCallback onTap;

  const SocialLoginButton({
    super.key,
    required this.image,
    required this.size,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: size.width * 0.25,
        decoration: BoxDecoration(
          color: AppColors.mediumBlue,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              offset: const Offset(1, 4),
              blurRadius: 1,
              spreadRadius: 1,
            )
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Image.asset(
          image,
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}
