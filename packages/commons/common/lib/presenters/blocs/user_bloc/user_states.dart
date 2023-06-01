part of 'user_bloc.dart';

sealed class UserStates {}

class UserLogged implements UserStates {
  final AppUser user;

  UserLogged({required this.user});
}

class UserLogout implements UserStates {}
