import 'package:common/common.dart';

class LoginModel {
  final Email email;
  final Password password;

  LoginModel()
      : email = Email(""),
        password = Password("", validatePassword: false);
}
