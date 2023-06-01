import 'package:common/common.dart';

class EmailAuthUsecaseImp implements EmailAuthUsecase {
  final AuthDatasource _authDatasource;
  final AppRepository _appRepository;

  EmailAuthUsecaseImp(
      {required AuthDatasource authDatasource,
      required AppRepository appRepository})
      : _authDatasource = authDatasource,
        _appRepository = appRepository;

  @override
  Future<Tuple<GenericError, AppUser>> call(LoginDto dto) async {
    final result = await _authDatasource.loginEmail(dto);
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
