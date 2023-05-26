import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final double? width;
  final VoidCallback onTap;
  final String text;
  final bool isReverseColor;
  final Widget? child;

  const CommonButton({
    super.key,
    this.width,
    required this.onTap,
    this.text = "",
    this.isReverseColor = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    double borderRadius = 100;
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: isReverseColor
            ? Border.all(
                width: 4,
                color: AppColors.primary,
              )
            : null,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius),
        color: isReverseColor ? Colors.transparent : AppColors.primary,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: AppColors.white.withOpacity(0.1),
          enableFeedback: false,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: child ??
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
