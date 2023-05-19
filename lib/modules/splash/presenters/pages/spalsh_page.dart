import 'package:expanses_app/modules/splash/presenters/controllers/splash_controller.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SplashController();
  }

  @override
  Widget build(BuildContext context) {
    _controller.redirect(context);

    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Icon(
          Icons.all_inclusive,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
