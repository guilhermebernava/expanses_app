import 'package:common/common.dart';

abstract interface class LogoutUsecase {
  Future<Tuple<GenericError, void>> call();
}
