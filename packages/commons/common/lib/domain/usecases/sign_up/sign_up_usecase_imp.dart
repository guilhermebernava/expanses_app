import 'package:common/common.dart';

class SignUpUsecaseImp implements SignUpUsecase {
  final AuthDatasource _authDatasource;
  final AppRepository _appRepository;

  SignUpUsecaseImp(
      {required AuthDatasource authDatasource,
      required AppRepository appRepository})
      : _authDatasource = authDatasource,
        _appRepository = appRepository;

  @override
  Future<Tuple<GenericError, AppUser>> call(SignUpDto dto) async {
    final result = await _authDatasource.signUp(dto);

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
