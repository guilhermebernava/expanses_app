import 'package:flutter/material.dart';

class AbstractBackground extends StatelessWidget {
  final Size size;
  final List<Widget> children;
  final double opacity;

  const AbstractBackground({
    super.key,
    required this.children,
    required this.size,
    this.opacity = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(
            "assets/images/texture.png",
          ),
          fit: BoxFit.cover,
          opacity: opacity,
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
