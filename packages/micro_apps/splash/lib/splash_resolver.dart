import 'package:common_dependencies/common_dependencies.dart';
import 'package:splash/injector.dart';
import 'package:common/common.dart';
import 'package:splash/modules/get_started/presenters/pages/get_started_page.dart';
import 'package:splash/modules/splash/presenters/pages/spalsh_page.dart';

class SplashResolver implements MicroApp {
  @override
  String get appName => "login";
  @override
  Map<String, WidgetBuilderArgs> get routes => {
        AppRoutes.splash: (context, args) => SplashPage(
              firstTimeAppUseCase: GetIt.instance.get(),
              getUserUsecase: GetIt.instance.get(),
              userBloc: GetIt.instance.get(),
            ),
        AppRoutes.getStarted: (context, args) => GetStartedPage(
              googleAuthUsecase: GetIt.instance.get(),
              userBloc: GetIt.instance.get(),
            ),
      };

  @override
  void Function() get injectionRegister => Injector.inject;
}
