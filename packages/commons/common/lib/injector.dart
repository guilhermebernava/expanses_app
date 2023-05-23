import 'package:common/datasources/databases/app_database/app_repository.dart';
import 'package:common/datasources/databases/app_database/shared_preferences/app_repository_shared_imp.dart';
import 'package:common_dependencies/common_dependencies.dart';

class CommonInjector {
  static void injection() {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<AppRepository>(
      () => AppRepositorySharedImp(),
    );
  }
}
