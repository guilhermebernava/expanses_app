import 'package:common/common.dart';
import 'package:common/domain/usecases/sign_up/sign_up_usecase.dart';
import 'package:common/infra/dtos/sign_up_dto.dart';

class SignUpUsecaseImp implements SignUpUsecase {
  final AuthDatasource _authDatasource;

  SignUpUsecaseImp({required AuthDatasource authDatasource})
      : _authDatasource = authDatasource;

  @override
  Future<Tuple<GenericError, AppUser>> call(SignUpDto dto) async {
    final result = await _authDatasource.signUp(dto);

    if (result.isLeft()) {
      return Tuple.left(GenericError(message: result.left.message));
    }
    return Tuple.right(result.right);
  }
}
