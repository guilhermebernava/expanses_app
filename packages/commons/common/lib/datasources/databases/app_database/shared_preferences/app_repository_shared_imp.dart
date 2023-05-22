import 'package:common/datasources/databases/app_database/app_repository.dart';
import 'package:common/datasources/errors/shared_error.dart';
import 'package:common/utils/tuple.dart';
import 'package:common_dependencies/common_dependencies.dart';

class AppRepositorySharedImp implements AppRepository {
  final String _firstTime = "first-time";
  // final String _user = "user";
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
}
