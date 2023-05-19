import 'package:flutter/material.dart';

class SplashController {
  void redirect(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushNamed("/login");
    });
  }
}
