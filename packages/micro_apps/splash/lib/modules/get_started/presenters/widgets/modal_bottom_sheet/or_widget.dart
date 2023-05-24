import 'package:common/common.dart';
import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  final Size size;
  final double percentageWidth;

  const OrWidget({
    super.key,
    required this.size,
    this.percentageWidth = 0.32,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: size.width * percentageWidth,
            height: 1,
            color: AppColors.white,
          ),
          Text(
            "or",
            textAlign: TextAlign.center,
            style: AppFonts.sourceSansPro(),
          ),
          Container(
            width: size.width * percentageWidth,
            height: 1,
            color: AppColors.white,
          )
        ],
      ),
    );
  }
}
