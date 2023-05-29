import 'package:flutter/material.dart';
import 'package:common/common.dart';
import 'package:splash/modules/get_started/domain/usecases/google_auth/google_auth_usecase.dart';

class GoogleAuthUsecaseImp implements GoogleAuthUsecase {
  final AuthDatasource _authSerivces;

  GoogleAuthUsecaseImp({required AuthDatasource authSerivces})
      : _authSerivces = authSerivces;

  @override
  Future<void> call(BuildContext context) async {
    await _authSerivces.loginGoogle().then((result) {
      if (result.isLeft()) {
        ShowErrorServices.showError(context, "Error in login with Google");
      }
      //TODO navegar para home
      print("loguei");
    });
  }
}
