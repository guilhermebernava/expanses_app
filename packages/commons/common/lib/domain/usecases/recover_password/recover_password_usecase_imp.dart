import 'package:common/common.dart';

class RecoverPasswordUsecaseImp implements RecoverPasswordUsecase {
  final AuthDatasource _authDatasource;

  RecoverPasswordUsecaseImp({required AuthDatasource authDatasource})
      : _authDatasource = authDatasource;

  @override
  Future<Tuple<GenericError, void>> call(String email) async {
    final result = await _authDatasource.forgotPassword(email);

    if (result.isLeft()) {
      return Tuple.left(GenericError(message: result.left.message));
    }

    return Tuple.right(null);
  }
}
