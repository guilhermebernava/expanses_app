import 'package:login/injector.dart';
import 'package:login/modules/login/presenters/pages/login_page.dart';
import 'package:login/modules/sign_up/presenters/pages/sign_up_page.dart';
import 'package:micro_core/micro_core.dart';

class LoginResolver implements MicroApp {
  @override
  String get appName => "login";
  @override
  Map<String, WidgetBuilderArgs> get routes => {
        "/login": (context, args) => const LoginPage(),
        "/sign-up": (context, args) => const SignUpPage(),
      };

  @override
  void Function() get injectionRegister => Injector.inject;
}
