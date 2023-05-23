import 'package:common_dependencies/common_dependencies.dart';
import 'package:login/modules/splash/domain/use_cases/first_time_app_usecase.dart';
import 'package:login/modules/splash/domain/use_cases/first_time_app_usecase_imp.dart';

class Injector {
  static void inject() {
    final getIt = GetIt.instance;

    getIt.registerLazySingleton<FirstTimeAppUseCase>(
      () => FirstTimeAppUsecaseImp(
        appRepository: getIt.get(),
      ),
    );

    //EXAMPLE
    // getIt.registerLazySingleton<SeaMonsterGetAllDatasource>(
    //   () => SeaMonsterGetAllApiDatasource(
    //     apiBase: getIt(),
    //     endpoint: ApiEndpoints.seaMonsterEndpoint,
    //   ),
    // );
  }
}
