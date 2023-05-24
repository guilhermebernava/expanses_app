import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final double width;
  final VoidCallback onTap;
  final String text;
  final bool isReverseColor;
  final Widget? child;

  const CommonButton({
    super.key,
    required this.width,
    required this.onTap,
    this.text = "",
    this.isReverseColor = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          border: isReverseColor
              ? Border.all(
                  width: 2,
                  color: AppColors.purple,
                )
              : null,
          color: isReverseColor ? Colors.transparent : AppColors.purple,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: child ??
              Text(
                text,
                textAlign: TextAlign.center,
                style: AppFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
        ),
      ),
    );
  }
}
