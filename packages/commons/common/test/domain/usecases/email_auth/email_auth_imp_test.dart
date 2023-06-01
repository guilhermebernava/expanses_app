import 'package:common/datasources/errors/api_error.dart';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:common/common.dart';
import 'package:mocktail/mocktail.dart';

class AuthServicesMock extends Mock implements AuthDatasource {}

class AppRepositoryMock extends Mock implements AppRepository {}

void main() {
  setUpAll(() {
    Map<String, Object> values = <String, Object>{};
    SharedPreferences.setMockInitialValues(values);
  });
  final authMock = AuthServicesMock();
  final repostioryMock = AppRepositoryMock();
  final correct = LoginDto(email: "a@a.com", password: "123");
  final error = LoginDto(email: "", password: "");

  final usecase = EmailAuthUsecaseImp(
    authDatasource: authMock,
    appRepository: repostioryMock,
  );

  test('It should  have success login in', () async {
    final user = AppUser(displayName: "", id: "");
    when(() => authMock.loginEmail(correct))
        .thenAnswer((invocation) async => Tuple.right(user));

    when(() => repostioryMock.registerUser(user))
        .thenAnswer((invocation) async => Tuple.right(null));

    final response = await usecase.call(correct);
    expect(response.isRight(), true);
    expect(response.right, isA<AppUser>());
  });

  test('It should show  error ', () async {
    when(() => authMock.loginEmail(error)).thenAnswer((invocation) async =>
        Tuple.left(
            ApiError(endpoint: "", message: "google_login", statusCode: 100)));

    final result = await usecase.call(error);
    expect(result.isLeft(), true);
  });

  test('It should show  error when APP_REPOSITORY has an ERROR', () async {
    final user = AppUser(displayName: "", id: "");

    when(() => authMock.loginEmail(correct))
        .thenAnswer((invocation) async => Tuple.right(user));

    when(() => repostioryMock.registerUser(user)).thenAnswer(
        (invocation) async =>
            Tuple.left(RepositoryError(title: 'shared_error')));

    final result = await usecase.call(correct);
    expect(result.isLeft(), true);
  });
}
