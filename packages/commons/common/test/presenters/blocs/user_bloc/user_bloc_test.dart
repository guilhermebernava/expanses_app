import 'package:bloc_test/bloc_test.dart';
import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final user = AppUser(displayName: "", id: "");

  blocTest<UserBloc, UserStates>(
    'emits [UserLogged] when MaintainLogin is call',
    build: () => UserBloc(),
    act: (bloc) => bloc.add(Login(user: user)),
    expect: () => [isA<UserLogged>()],
  );
  blocTest<UserBloc, UserStates>(
    'emits [UserLogged] when Login is Success',
    build: () => UserBloc(),
    act: (bloc) => bloc.add(Logout()),
    expect: () => [isA<UserLogout>()],
  );
}
