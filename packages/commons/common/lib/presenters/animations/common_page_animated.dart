import 'package:common/designs/app_colors.dart';
import 'package:common/presenters/animations/moving_animation.dart';
import 'package:common/presenters/pages/common_page_structure.dart';
import 'package:flutter/material.dart';

class CommonPageAnimated extends StatelessWidget {
  final Size size;
  final Widget body;
  final bool canPopUp;
  final EdgeInsets? padding;

  const CommonPageAnimated({
    super.key,
    required this.body,
    required this.size,
    this.padding,
    this.canPopUp = true,
  });

  @override
  Widget build(BuildContext context) {
    return CommonPageStructure(
      canPopUp: canPopUp,
      size: size,
      padding: padding ?? const EdgeInsets.all(20),
      container: MovingAnimation(
        child: Container(
          width: size.width,
          height: size.height * 0.895,
          padding: padding,
          decoration: BoxDecoration(
            color: AppColors.darkBlue,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 5,
              )
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: body,
        ),
      ),
    );
  }
}
