import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CommonTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double fontSize;

  const CommonTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(text),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
            style: AppFonts.montserrat(
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
