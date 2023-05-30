import 'package:common/datasources/databases/app_database/app_repository.dart';
import 'package:common/datasources/errors/shared_error.dart';
import 'package:common/domain/entities/user.dart';
import 'package:common/infra/dtos/app_user_dto.dart';
import 'package:common/utils/tuple.dart';
import 'package:common_dependencies/common_dependencies.dart';

class AppRepositorySharedImp implements AppRepository {
  final String _firstTime = "first-time";
  final String _user = "user";
  @override
  Future<Tuple<SharedError, void>> firstTimeApp() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final success = await prefs.setBool(_firstTime, false);

      if (success == false) {
        return Tuple.left(
          SharedError(
            title: "Error in saving FirstTimeApp",
          ),
        );
      }

      return Tuple.right(null);
    } catch (e) {
      return Tuple.left(
        SharedError(
          title: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Tuple<SharedError, bool>> isFirstTime() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final exist = prefs.get(_firstTime);
      return Tuple.right(exist == null);
    } catch (e) {
      return Tuple.left(
        SharedError(
          title: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Tuple<SharedError, AppUser>> getUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final user = prefs.getString(_user);
      if (user == null) {
        return Tuple.left(SharedError(title: "Not user found"));
      }

      return Tuple.right(AppUserDto.fromJson(user));
    } catch (e) {
      return Tuple.left(
        SharedError(
          title: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Tuple<SharedError, void>> registerUser(AppUser user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final saved = await prefs.setString(_user, AppUserDto.toJson(user));

      if (!saved) {
        return Tuple.left(
            SharedError(title: "Error in register user in shared_preferences"));
      }
      return Tuple.right(null);
    } catch (e) {
      return Tuple.left(
        SharedError(
          title: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Tuple<SharedError, void>> deleteUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final existUser = await getUser();

      if (existUser.isLeft()) {
        return Tuple.right(null);
      }

      final deleted = await prefs.remove(_user);

      if (deleted) {
        return Tuple.right(null);
      }

      return Tuple.left(SharedError(
        title: "Error in removing USER from SharedPreferences",
      ));
    } catch (e) {
      return Tuple.left(
        SharedError(
          title: e.toString(),
        ),
      );
    }
  }
}
