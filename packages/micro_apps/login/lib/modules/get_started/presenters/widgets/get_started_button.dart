import 'package:common/common.dart';
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  final Size size;
  const GetStartedButton({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, "/login");
      },
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: AppColors.purple,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "Get Started",
            textAlign: TextAlign.center,
            style: AppFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
