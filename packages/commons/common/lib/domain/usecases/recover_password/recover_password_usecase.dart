import 'package:common/common.dart';

abstract class RecoverPasswordUsecase {
  Future<Tuple<GenericError, void>> call(String email);
}
