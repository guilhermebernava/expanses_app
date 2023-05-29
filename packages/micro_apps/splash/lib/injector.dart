import 'package:common_dependencies/common_dependencies.dart';
import 'package:splash/modules/get_started/domain/usecases/google_auth/google_auth_usecase.dart';
import 'package:splash/modules/get_started/domain/usecases/google_auth/google_auth_usecase_imp.dart';
import 'package:splash/modules/splash/domain/use_cases/first_time_app_usecase.dart';
import 'package:splash/modules/splash/domain/use_cases/first_time_app_usecase_imp.dart';

class Injector {
  static void inject() {
    final getIt = GetIt.instance;

    getIt.registerLazySingleton<FirstTimeAppUseCase>(
      () => FirstTimeAppUsecaseImp(
        appRepository: getIt.get(),
      ),
    );

    getIt.registerLazySingleton<GoogleAuthUsecase>(
      () => GoogleAuthUsecaseImp(
        authSerivces: getIt.get(),
      ),
    );
  }
}
