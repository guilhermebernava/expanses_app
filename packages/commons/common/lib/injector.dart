import 'package:common/common.dart';
import 'package:common/datasources/databases/app_database/secure_storage/app_repository_secure_imp.dart';
import 'package:common_dependencies/common_dependencies.dart';

class CommonInjector {
  static void injection() {
    GetIt getIt = GetIt.instance;

    //DATASOURCES
    getIt.registerLazySingleton<AppRepository>(
      () => AppRepositorySecureImp(),
    );

    getIt.registerLazySingleton<AuthDatasource>(
      () => FirebaseAuthDatasourceImp(),
    );

    //DOMAIN
    getIt.registerLazySingleton<GoogleAuthUsecase>(
      () => GoogleAuthUsecaseImp(
        authDatasource: getIt.get(),
        appRepository: getIt.get(),
      ),
    );

    getIt.registerLazySingleton<SignUpUsecase>(
      () => SignUpUsecaseImp(
        authDatasource: getIt.get(),
        appRepository: getIt.get(),
      ),
    );

    getIt.registerLazySingleton<EmailAuthUsecase>(
      () => EmailAuthUsecaseImp(
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

    //BLOCS
    getIt.registerSingleton(UserBloc());
  }
}
