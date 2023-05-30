import 'package:login/injector.dart';
import 'package:login/modules/login/presenters/pages/login_page.dart';
import 'package:login/modules/sign_up/presenters/pages/sign_up_page.dart';
import 'package:micro_core/micro_core.dart';
import 'package:common/common.dart';

class LoginResolver implements MicroApp {
  @override
  String get appName => "login";
  @override
  Map<String, WidgetBuilderArgs> get routes => {
        AppRoutes.signIn: (context, args) => const LoginPage(),
        AppRoutes.signUp: (context, args) => const SignUpPage(),
      };

  @override
  void Function() get injectionRegister => Injector.inject;
}
