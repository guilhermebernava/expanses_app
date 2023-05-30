import 'package:common/common.dart';
import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  final Size size;
  final double percentageWidth;

  const OrWidget({
    super.key,
    required this.size,
    this.percentageWidth = 0.25,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: size.width * percentageWidth,
          height: 1,
          color: AppColors.grey,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "or",
            textAlign: TextAlign.center,
            style: AppFonts.sourceSansPro(fontSize: 16, color: AppColors.grey),
          ),
        ),
        Container(
          width: size.width * percentageWidth,
          height: 1,
          color: AppColors.grey,
        )
      ],
    );
  }
}
