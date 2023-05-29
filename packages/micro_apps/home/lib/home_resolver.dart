import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

class HomeResolver implements MicroApp {
  @override
  String get appName => "home";

  @override
  void Function() get injectionRegister => () {};

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        "/home": (context, args) => const Scaffold(
              body: Center(child: Text("HOME")),
            ),
      };
}
