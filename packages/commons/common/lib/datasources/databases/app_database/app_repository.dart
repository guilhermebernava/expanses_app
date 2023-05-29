import 'package:common/datasources/errors/shared_error.dart';
import 'package:common/domain/entities/user.dart';
import 'package:common/utils/tuple.dart';

abstract class AppRepository {
  Future<Tuple<SharedError, AppUser>> getUser();
  Future<Tuple<SharedError, void>> registerUser(AppUser user);
  Future<Tuple<SharedError, void>> firstTimeApp();
  Future<Tuple<SharedError, bool>> isFirstTime();
}
