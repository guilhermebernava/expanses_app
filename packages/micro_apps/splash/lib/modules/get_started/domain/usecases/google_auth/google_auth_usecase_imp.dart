import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:splash/modules/get_started/domain/usecases/google_auth/google_auth_usecase.dart';

class GoogleAuthUsecaseImp implements GoogleAuthUsecase {
  //TODO transferir use case para o COMMON pois o LOGIN também irá usar
  final AuthDatasource _authSerivces;
  final AppRepository _appRepository;

  GoogleAuthUsecaseImp(
      {required AuthDatasource authSerivces,
      required AppRepository appRepository})
      : _authSerivces = authSerivces,
        _appRepository = appRepository;

  @override
  Future<void> call(BuildContext context) async {
    final result = await _authSerivces.loginGoogle();
    if (result.isLeft() && context.mounted) {
      return ShowErrorServices.showError(
          context, result.left.message ?? "UNKNOWN ERROR");
    }

    final saved = await _appRepository.registerUser(result.right);
    if (saved.isLeft() && context.mounted) {
      return ShowErrorServices.showError(context, saved.left.title);
    }
  }
}
