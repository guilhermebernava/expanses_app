import 'package:common/common.dart';
import 'package:common_dependencies/common_dependencies.dart';

class CommonInjector {
  static void injection() {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<AppRepository>(
      () => AppRepositorySharedImp(),
    );

    getIt.registerLazySingleton<AuthDatasource>(
      () => FirebaseAuthDatasourceImp(),
    );

    getIt.registerLazySingleton<GoogleAuthUsecase>(
      () => GoogleAuthUsecaseImp(
        authDatasource: getIt.get(),
        appRepository: getIt.get(),
      ),
    );

    getIt.registerLazySingleton<LogoutUsecase>(
      () => LogoutUsecaseImp(
        authDatasource: getIt.get(),
        appRepository: getIt.get(),
      ),
    );
  }
}
