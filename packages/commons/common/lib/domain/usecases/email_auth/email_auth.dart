import 'package:common/common.dart';

abstract interface class EmailAuthUsecase {
  Future<Tuple<GenericError, AppUser>> call(LoginDto dto);
}
