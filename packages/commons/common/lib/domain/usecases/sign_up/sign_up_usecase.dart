import 'package:common/common.dart';

abstract interface class SignUpUsecase {
  Future<Tuple<GenericError, AppUser>> call(SignUpDto dto);
}
