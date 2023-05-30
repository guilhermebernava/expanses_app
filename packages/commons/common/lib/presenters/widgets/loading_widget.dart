import 'package:common/common.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Color color;
  final bool isSocialButton;

  const LoadingWidget({
    super.key,
    this.color = AppColors.primary,
    this.isSocialButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isSocialButton ? 35 : null,
      height: isSocialButton ? 35 : null,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 5,
      ),
    );
  }
}
