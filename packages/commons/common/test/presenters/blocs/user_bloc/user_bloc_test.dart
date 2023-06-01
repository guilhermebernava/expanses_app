import 'package:bloc_test/bloc_test.dart';
import 'package:common/common.dart';
import 'package:common/domain/errors/generic_error.dart';
import 'package:common/presenters/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class EmailAuthMock extends Mock implements EmailAuthUsecase {}

class GoogleAuthMock extends Mock implements GoogleAuthUsecase {}

class LogoutMock extends Mock implements LogoutUsecase {}

void main() {
  final emailMock = EmailAuthMock();
  final googleMock = GoogleAuthMock();
  final logoutMock = LogoutMock();

  final dto = LoginDto(email: "a@a.com", password: "123");
  final user = AppUser(displayName: "", id: "");

  group("EMAIL AUTH", () {
    blocTest<UserBloc, UserStates>(
      'emits [UserLogged] when Login is Success',
      build: () => UserBloc(
        emailAuthUsecase: emailMock,
        googleAuthUsecase: googleMock,
        logoutUsecase: logoutMock,
      ),
      setUp: () {
        when(
          () => emailMock(dto),
        ).thenAnswer((invocation) async => Tuple.right(user));
      },
      act: (bloc) => bloc.add(Login(dto: dto)),
      expect: () => [isA<UserLogged>()],
      wait: const Duration(seconds: 1),
    );

    blocTest<UserBloc, UserStates>(
      'emits [UserError] when Login is NOT Success',
      build: () => UserBloc(
        emailAuthUsecase: emailMock,
        googleAuthUsecase: googleMock,
        logoutUsecase: logoutMock,
      ),
      setUp: () {
        when(
          () => emailMock(dto),
        ).thenAnswer(
            (invocation) async => Tuple.left(GenericError(message: "")));
      },
      act: (bloc) => bloc.add(Login(dto: dto)),
      expect: () => [isA<UserError>()],
      wait: const Duration(seconds: 1),
    );
  });

  group("GOOGLE AUTH", () {
    blocTest<UserBloc, UserStates>(
      'emits [UserLogged] when Login is Success',
      build: () => UserBloc(
        emailAuthUsecase: emailMock,
        googleAuthUsecase: googleMock,
        logoutUsecase: logoutMock,
      ),
      setUp: () {
        when(
          () => googleMock(),
        ).thenAnswer((invocation) async => Tuple.right(user));
      },
      act: (bloc) => bloc.add(LoginGoogle()),
      expect: () => [isA<UserLogged>()],
      wait: const Duration(seconds: 1),
    );

    blocTest<UserBloc, UserStates>(
      'emits [UserError] when Login is NOT Success',
      build: () => UserBloc(
        emailAuthUsecase: emailMock,
        googleAuthUsecase: googleMock,
        logoutUsecase: logoutMock,
      ),
      setUp: () {
        when(
          () => googleMock(),
        ).thenAnswer(
            (invocation) async => Tuple.left(GenericError(message: "")));
      },
      act: (bloc) => bloc.add(LoginGoogle()),
      expect: () => [isA<UserError>()],
      wait: const Duration(seconds: 1),
    );
  });

  group("LOGOUT", () {
    blocTest<UserBloc, UserStates>(
      'emits [UserLogged] when Login is Success',
      build: () => UserBloc(
        emailAuthUsecase: emailMock,
        googleAuthUsecase: googleMock,
        logoutUsecase: logoutMock,
      ),
      setUp: () {
        when(
          () => logoutMock(),
        ).thenAnswer((invocation) async => Tuple.right(null));
      },
      act: (bloc) => bloc.add(Logout()),
      expect: () => [isA<UserLogout>()],
      wait: const Duration(seconds: 1),
    );

    blocTest<UserBloc, UserStates>(
      'emits [UserError] when Login is NOT Success',
      build: () => UserBloc(
        emailAuthUsecase: emailMock,
        googleAuthUsecase: googleMock,
        logoutUsecase: logoutMock,
      ),
      setUp: () {
        when(
          () => logoutMock(),
        ).thenAnswer(
            (invocation) async => Tuple.left(GenericError(message: "")));
      },
      act: (bloc) => bloc.add(Logout()),
      expect: () => [isA<UserError>()],
      wait: const Duration(seconds: 1),
    );
  });
}
