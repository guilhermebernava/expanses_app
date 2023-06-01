part of 'user_bloc.dart';

sealed class UserEvents {}

class Login implements UserEvents {
  final AppUser user;

  Login({
    required this.user,
  });
}

class Logout implements UserEvents {}
