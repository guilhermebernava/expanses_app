import 'package:common/common.dart';
import 'package:flutter/material.dart';

class GoogleAuthUsecaseImp implements GoogleAuthUsecase {
  final AuthDatasource _authDatasource;
  final AppRepository _appRepository;

  GoogleAuthUsecaseImp(
      {required AuthDatasource authDatasource,
      required AppRepository appRepository})
      : _authDatasource = authDatasource,
        _appRepository = appRepository;

  @override
  Future<void> call(BuildContext context) async {
    final result = await _authDatasource.loginGoogle();
    if (result.isLeft() && context.mounted) {
      return ShowErrorServices.showError(context, result.left.message);
    }

    final saved = await _appRepository.registerUser(result.right);
    if (saved.isLeft() && context.mounted) {
      return ShowErrorServices.showError(context, saved.left.title);
    }

    if (context.mounted) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.home, (_) => false);
    }
  }
}
