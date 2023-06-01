part of 'user_bloc.dart';

sealed class UserEvents {}

class Login implements UserEvents {
  final LoginDto dto;

  Login({
    required this.dto,
  });
}

class LoginGoogle implements UserEvents {}

class Logout implements UserEvents {}
