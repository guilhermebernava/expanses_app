import 'package:common/common.dart';
import 'package:common/infra/dtos/sign_up_dto.dart';

abstract interface class SignUpUsecase {
  Future<Tuple<GenericError, AppUser>> call(SignUpDto dto);
}
