import 'package:flutter/material.dart';

class CommonPage extends StatelessWidget {
  final Widget body;
  final Color? backgroundColor;
  final EdgeInsets padding;

  const CommonPage({
    super.key,
    required this.body,
    this.backgroundColor,
    this.padding = const EdgeInsets.only(top: 20, left: 20, right: 20),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: Padding(
          padding: padding,
          child: body,
        ),
      ),
    );
  }
}
