import 'package:common_dependencies/common_dependencies.dart';
import 'package:login/injector.dart';
import 'package:login/modules/choice_sign/presenters/choice_sign_page.dart';
import 'package:login/modules/login/presenters/pages/login_page.dart';
import 'package:login/modules/sign_up/presenters/pages/sign_up_page.dart';
import 'package:common/common.dart';

class LoginResolver implements MicroApp {
  @override
  String get appName => "login";
  @override
  Map<String, WidgetBuilderArgs> get routes => {
        AppRoutes.choiceSign: (context, args) => ChoiceSignPage(
              googleAuthUsecase: GetIt.instance.get(),
            ),
        AppRoutes.signIn: (context, args) => LoginPage(
              googleAuthUsecase: GetIt.instance.get(),
            ),
        AppRoutes.signUp: (context, args) => const SignUpPage(),
      };

  @override
  void Function() get injectionRegister => Injector.inject;
}
