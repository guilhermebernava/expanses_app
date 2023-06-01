import 'package:common/common.dart';
import 'package:flutter/material.dart';

class HomePageController {
  final UserBloc userBloc;
  final LogoutUsecase logoutUsecase;

  HomePageController({
    required this.userBloc,
    required this.logoutUsecase,
  });

  Future<void> logout(BuildContext context) async {
    final logout = await logoutUsecase();
    if (logout.isLeft() && context.mounted) {
      return ShowErrorServices.showError(context, logout.left.message);
    }
    userBloc.add(Logout());
    if (context.mounted) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.choiceSign, (route) => false);
    }
  }
}
