import 'package:common/common.dart';
import 'package:flutter/material.dart';

class AbstractBackground extends StatelessWidget {
  final Size size;
  final List<Widget> children;
  final double opacity;
  final String image;

  const AbstractBackground({
    super.key,
    required this.children,
    required this.size,
    this.opacity = 0.1,
    this.image = AppAssets.background,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          opacity: opacity,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
