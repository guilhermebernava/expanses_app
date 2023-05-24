import 'package:micro_core/micro_core.dart';
import 'package:splash/injector.dart';
import 'package:splash/modules/get_started/presenters/pages/get_started_page.dart';
import 'package:splash/modules/splash/presenters/pages/spalsh_page.dart';

class SplashResolver implements MicroApp {
  @override
  String get appName => "login";
  @override
  Map<String, WidgetBuilderArgs> get routes => {
        "/splash": (context, args) => const SplashPage(),
        "/get-started": (context, args) => const GetStartedPage(),
      };

  @override
  void Function() get injectionRegister => Injector.inject;
}
