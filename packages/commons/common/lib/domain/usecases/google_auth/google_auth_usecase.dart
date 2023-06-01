import 'package:common/common.dart';

abstract interface class GoogleAuthUsecase {
  Future<Tuple<GenericError, AppUser>> call();
}
