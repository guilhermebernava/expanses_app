import 'package:flutter/material.dart';
import 'package:common/common.dart';

class HomePage extends StatelessWidget {
  final LogoutUsecase logoutUsecase;
  const HomePage({
    super.key,
    required this.logoutUsecase,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CommonButtonText(
          width: 150,
          onTap: () async => await logoutUsecase(),
          text: "LOGOUT",
        ),
      ),
    );
  }
}
