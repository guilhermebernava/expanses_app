import 'package:common/designs/app_colors.dart';
import 'package:common/presenters/widgets/common_close_button.dart';
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
          padding: const EdgeInsets.only(left: 10, top: 40, bottom: 15),
          child: CommonCloseButton(
            color: color,
            onTap: onTap,
            key: const ValueKey("appBar"),
          ),
        )
      ],
    );
  }
}
