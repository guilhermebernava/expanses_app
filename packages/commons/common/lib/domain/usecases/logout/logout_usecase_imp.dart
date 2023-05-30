import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

class LogoutUsecaseImp implements LogoutUsecase {
  final AuthDatasource _authDatasource;
  final AppRepository _appRepository;

  LogoutUsecaseImp({
    required AuthDatasource authDatasource,
    required AppRepository appRepository,
  })  : _authDatasource = authDatasource,
        _appRepository = appRepository;

  @override
  Future<void> call(BuildContext context) async {
    final result = await _authDatasource.logout();

    if (result.isLeft() && context.mounted) {
      ShowErrorServices.showError(context, result.left.message);
      return;
    }

    final deleted = await _appRepository.deleteUser();

    if (deleted.isLeft() && context.mounted) {
      ShowErrorServices.showError(context, deleted.left.title);
      return;
    }
    if (context.mounted) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.choiceSign, (_) => false);
    }
  }
}
