import 'package:common/datasources/errors/repository_error.dart';
import 'package:common/domain/entities/user.dart';
import 'package:common/utils/tuple.dart';

abstract class AppRepository {
  Future<Tuple<RepositoryError, AppUser>> getUser();
  Future<Tuple<RepositoryError, void>> registerUser(AppUser user);
  Future<Tuple<RepositoryError, bool>> isFirstTime();
  Future<Tuple<RepositoryError, void>> deleteUser();
}
