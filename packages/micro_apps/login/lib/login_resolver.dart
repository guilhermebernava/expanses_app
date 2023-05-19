import 'package:login/injector.dart';
import 'package:micro_core/micro_core.dart';

class LoginMicroApp implements MicroApp {
  @override
  String get appName => "login";

  @override
  Map<String, WidgetBuilderArgs> get routes => {};

  @override
  void Function() get injectionRegister => Injector.inject;
}
