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

  final usecase = GoogleAuthUsecaseImp(
    authDatasource: authMock,
    appRepository: repostioryMock,
  );

  test('It should have success login in', () async {
    final user = AppUser(displayName: "", id: "");
    when(() => authMock.loginGoogle())
        .thenAnswer((invocation) async => Tuple.right(user));

    when(() => repostioryMock.registerUser(user))
        .thenAnswer((invocation) async => Tuple.right(null));

    final result = await usecase.call();
    expect(result.isRight(), true);
    expect(result.right, isA<AppUser>());
  });

  test('It should show error when GOOGLE has an ERROR', () async {
    when(() => authMock.loginGoogle()).thenAnswer((invocation) async =>
        Tuple.left(
            ApiError(endpoint: "", message: "google_login", statusCode: 100)));

    final result = await usecase.call();
    expect(result.isLeft(), true);
  });

  test('It should show error when APP_REPOSITORY has an ERROR', () async {
    final user = AppUser(displayName: "", id: "");

    when(() => authMock.loginGoogle())
        .thenAnswer((invocation) async => Tuple.right(user));

    when(() => repostioryMock.registerUser(user)).thenAnswer(
        (invocation) async =>
            Tuple.left(RepositoryError(title: 'shared_error')));

    final result = await usecase.call();
    expect(result.isLeft(), true);
  });
}
