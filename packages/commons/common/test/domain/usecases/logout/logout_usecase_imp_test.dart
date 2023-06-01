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

  final usecase = LogoutUsecaseImp(
    authDatasource: authMock,
    appRepository: repostioryMock,
  );

  test('It should have success logout', () async {
    when(() => authMock.logout())
        .thenAnswer((invocation) async => Tuple.right(null));

    when(() => repostioryMock.deleteUser())
        .thenAnswer((invocation) async => Tuple.right(null));

    final result = await usecase.call();
    expect(result.isRight(), true);
  });

  test('It should show error when LOGOUT has an ERROR', () async {
    when(() => authMock.logout()).thenAnswer((invocation) async => Tuple.left(
        ApiError(endpoint: "", message: "logout error", statusCode: 100)));

    final result = await usecase.call();
    expect(result.isLeft(), true);
  });

  test('It should show error when APP_REPOSITORY has an ERROR', () async {
    when(() => authMock.logout())
        .thenAnswer((invocation) async => Tuple.right(null));

    when(() => repostioryMock.deleteUser()).thenAnswer((invocation) async =>
        Tuple.left(RepositoryError(title: 'shared_error')));

    final result = await usecase.call();
    expect(result.isLeft(), true);
  });
}
