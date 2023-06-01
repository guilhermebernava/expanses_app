import 'package:common/common.dart';

class SignUpModel {
  final Email email;
  final Password password;
  final Password confirmPassword;

  SignUpModel()
      : email = Email(""),
        password = Password(""),
        confirmPassword = Password("");
}
