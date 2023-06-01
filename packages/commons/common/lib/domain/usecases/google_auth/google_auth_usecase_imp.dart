import 'package:common/common.dart';

class GoogleAuthUsecaseImp implements GoogleAuthUsecase {
  final AuthDatasource _authDatasource;
  final AppRepository _appRepository;

  GoogleAuthUsecaseImp(
      {required AuthDatasource authDatasource,
      required AppRepository appRepository})
      : _authDatasource = authDatasource,
        _appRepository = appRepository;

  @override
  Future<Tuple<GenericError, AppUser>> call() async {
    final result = await _authDatasource.loginGoogle();
    if (result.isLeft()) {
      return Tuple.left(GenericError(message: result.left.message));
    }

    final saved = await _appRepository.registerUser(result.right);
    if (saved.isLeft()) {
      return Tuple.left(GenericError(message: saved.left.title));
    }

    return Tuple.right(result.right);
  }
}
