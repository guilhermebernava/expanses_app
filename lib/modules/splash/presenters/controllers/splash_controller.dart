import 'package:flutter/material.dart';

class SplashController {
  void redirect(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2500)).then((value) {
      Navigator.of(context).pushNamed("/login");
    });
  }
}
