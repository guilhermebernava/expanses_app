import 'package:common/common.dart';
import 'package:flutter/material.dart';

class SignUpLogo extends StatelessWidget {
  const SignUpLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            "Sign Up".toUpperCase(),
            style: AppFonts.montserrat(
                fontSize: 30,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                shadows: [
                  const Shadow(
                    color: AppColors.blue,
                    blurRadius: 4,
                  )
                ]),
          ),
          Container(
            height: 2.5,
            width: 150,
            decoration:
                const BoxDecoration(color: AppColors.primary, boxShadow: [
              BoxShadow(
                color: AppColors.blue,
                blurRadius: 4,
              )
            ]),
          )
        ],
      ),
    );
  }
}
