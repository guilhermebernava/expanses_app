import 'package:flutter/material.dart';
import 'package:common/common.dart';
import 'package:home/presenters/controllers/home_page_controller.dart';

class HomePage extends StatelessWidget {
  final HomePageController controller;

  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CommonButtonText(
          width: 150,
          onTap: () => controller.logout(context),
          text: "LOGOUT",
        ),
      ),
    );
  }
}
