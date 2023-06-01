import 'package:common/common.dart';
import 'package:common/domain/errors/generic_error.dart';

abstract interface class EmailAuthUsecase {
  Future<Tuple<GenericError, AppUser>> call(LoginDto dto);
}
