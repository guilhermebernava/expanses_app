import 'package:common/datasources/databases/app_database/app_repository.dart';
import 'package:common/datasources/errors/repository_error.dart';
import 'package:common/domain/entities/user.dart';
import 'package:common/infra/dtos/app_user_dto.dart';
import 'package:common/utils/tuple.dart';
import 'package:common_dependencies/common_dependencies.dart';

class AppRepositorySecureImp implements AppRepository {
  final _storage = const FlutterSecureStorage();
  final _user = "user";
  final _firstTime = "first-time";

  @override
  Future<Tuple<RepositoryError, void>> deleteUser() async {
    try {
      final existUser = await _storage.read(key: _user);

      if (existUser == null) {
        return Tuple.left(RepositoryError(title: "Not user found"));
      }
      await _storage.delete(key: _user);
      return Tuple.right(null);
    } catch (e) {
      return Tuple.left(RepositoryError(title: e.toString()));
    }
  }

  @override
  Future<Tuple<RepositoryError, AppUser>> getUser() async {
    try {
      final existUser = await _storage.read(key: _user);

      if (existUser == null) {
        return Tuple.left(RepositoryError(title: "Not user found"));
      }
      final user = AppUserDto.fromJson(existUser);
      return Tuple.right(user);
    } catch (e) {
      return Tuple.left(RepositoryError(title: e.toString()));
    }
  }

  @override
  Future<Tuple<RepositoryError, bool>> isFirstTime() async {
    try {
      final isFirstTime = await _storage.read(key: _firstTime);

      if (isFirstTime == null) {
        await _storage.write(key: _firstTime, value: "true");
        return Tuple.right(true);
      }
      return Tuple.right(false);
    } catch (e) {
      return Tuple.left(RepositoryError(title: e.toString()));
    }
  }

  @override
  Future<Tuple<RepositoryError, void>> registerUser(AppUser user) async {
    try {
      final jsonUser = AppUserDto.toJson(user);
      await _storage.write(key: _user, value: jsonUser);
      return Tuple.right(null);
    } catch (e) {
      return Tuple.left(RepositoryError(title: e.toString()));
    }
  }
}
