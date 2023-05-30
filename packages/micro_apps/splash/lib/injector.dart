import 'package:common_dependencies/common_dependencies.dart';
import 'package:splash/modules/splash/domain/use_cases/first_time_app/first_time_app_usecase.dart';
import 'package:splash/modules/splash/domain/use_cases/first_time_app/first_time_app_usecase_imp.dart';
import 'package:splash/modules/splash/domain/use_cases/get_user/get_user_usecase.dart';
import 'package:splash/modules/splash/domain/use_cases/get_user/get_user_usecase_imp.dart';

class Injector {
  static void inject() {
    final getIt = GetIt.instance;

    getIt.registerLazySingleton<FirstTimeAppUseCase>(
      () => FirstTimeAppUsecaseImp(
        appRepository: getIt.get(),
      ),
    );

    getIt.registerLazySingleton<GetUserUsecase>(
      () => GetUserUsecaseImp(
        appRepository: getIt.get(),
      ),
    );
  }
}
