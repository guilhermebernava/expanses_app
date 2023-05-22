import 'package:common/datasources/errors/shared_error.dart';
import 'package:common/utils/tuple.dart';

abstract class AppRepository {
  //TODO implementar shared_preferences para USER
  // Future<Tuple<SharedError, void>> existUser();
  // Future<Tuple<SharedError, void>> registerUser();
  Future<Tuple<SharedError, void>> firstTimeApp();
  Future<Tuple<SharedError, bool>> isFirstTime();
}
