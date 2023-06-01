import 'package:common/common.dart';

abstract interface class GetUserUsecase {
  Future<Tuple<GenericError, AppUser>> call();
}
