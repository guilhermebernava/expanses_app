import 'package:login/injector.dart';
import 'package:login/modules/get_started/presenters/pages/get_started_page.dart';
import 'package:micro_core/micro_core.dart';

class LoginResolver implements MicroApp {
  @override
  String get appName => "login";

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        "/login": (context, args) => const GetStartedPage(),
        "/get-started": (context, args) => const GetStartedPage(),
      };

  @override
  void Function() get injectionRegister => Injector.inject;
}
