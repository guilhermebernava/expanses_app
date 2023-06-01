import 'package:common_dependencies/common_dependencies.dart';
import 'package:common/common.dart';
import 'package:home/presenters/controllers/home_page_controller.dart';
import 'package:home/presenters/pages/home_page.dart';

class HomeResolver implements MicroApp {
  @override
  String get appName => "home";

  @override
  void Function() get injectionRegister => () {};

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        AppRoutes.home: (context, args) => HomePage(
              controller: HomePageController(
                logoutUsecase: GetIt.instance.get(),
                userBloc: GetIt.instance.get(),
              ),
            ),
      };
}
