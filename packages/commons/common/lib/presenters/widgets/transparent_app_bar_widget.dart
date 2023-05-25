import 'package:common/designs/app_colors.dart';
import 'package:flutter/material.dart';

class TransparentAppBarWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final Color color;
  const TransparentAppBarWidget({
    super.key,
    this.color = AppColors.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 30, bottom: 15),
          child: GestureDetector(
            onTap: onTap ??
                () {
                  Navigator.pop(context);
                },
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 25,
              color: color,
            ),
          ),
        )
      ],
    );
  }
}
