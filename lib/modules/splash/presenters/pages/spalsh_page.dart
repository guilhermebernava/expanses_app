import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
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
