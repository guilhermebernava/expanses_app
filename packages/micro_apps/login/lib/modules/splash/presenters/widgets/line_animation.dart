import 'package:common/common.dart';
import 'package:flutter/material.dart';

class LineAnimationWidget extends StatefulWidget {
  final bool isReverse;
  const LineAnimationWidget({
    super.key,
    this.isReverse = false,
  });

  @override
  State<LineAnimationWidget> createState() => _LineAnimationWidgetState();
}

class _LineAnimationWidgetState extends State<LineAnimationWidget>
    with TickerProviderStateMixin {
  double _width = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _width = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _width,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(
            left: widget.isReverse ? 60 : 120,
            right: widget.isReverse ? 120 : 60,
          ),
          child: Container(
            height: 2.5,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
