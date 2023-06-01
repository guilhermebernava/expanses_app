import 'package:common/common.dart';
import 'package:common/domain/errors/generic_error.dart';

abstract interface class LogoutUsecase {
  Future<Tuple<GenericError, void>> call();
}
