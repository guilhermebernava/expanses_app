import 'package:login/injector.dart';
import 'package:login/modules/login/presenters/pages/login_page.dart';
import 'package:micro_core/micro_core.dart';

class LoginResolver implements MicroApp {
  @override
  String get appName => "login";
//TODO derecionar o usuario para HOME quando já estiver logado
  @override
  Map<String, WidgetBuilderArgs> get routes => {
        "/login": (context, args) => const LoginPage(),
      };

  @override
  void Function() get injectionRegister => Injector.inject;
}
