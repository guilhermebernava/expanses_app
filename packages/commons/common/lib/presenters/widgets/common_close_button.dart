import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CommonCloseButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color color;

  const CommonCloseButton({
    super.key,
    this.onTap,
    this.color = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key,
      onTap: onTap ??
          () {
            Navigator.pop(context);
          },
      child: Icon(
        Icons.close,
        size: 30,
        color: color,
      ),
    );
  }
}
