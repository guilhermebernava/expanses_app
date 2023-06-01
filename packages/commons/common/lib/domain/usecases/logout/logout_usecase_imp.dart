import 'package:common/common.dart';

class LogoutUsecaseImp implements LogoutUsecase {
  final AuthDatasource _authDatasource;
  final AppRepository _appRepository;

  LogoutUsecaseImp({
    required AuthDatasource authDatasource,
    required AppRepository appRepository,
  })  : _authDatasource = authDatasource,
        _appRepository = appRepository;

  @override
  Future<Tuple<GenericError, void>> call() async {
    final result = await _authDatasource.logout();

    if (result.isLeft()) {
      return Tuple.left(GenericError(message: result.left.message));
    }

    final deleted = await _appRepository.deleteUser();

    if (deleted.isLeft()) {
      return Tuple.left(GenericError(message: deleted.left.title));
    }
    return Tuple.right(null);
  }
}
