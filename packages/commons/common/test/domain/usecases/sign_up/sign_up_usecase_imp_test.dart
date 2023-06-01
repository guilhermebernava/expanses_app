import 'package:common/common.dart';
import 'package:common/datasources/errors/api_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthMock extends Mock implements AuthDatasource {}

class RepoMock extends Mock implements AppRepository {}

void main() {
  final authMock = AuthMock();
  final repoMock = RepoMock();
  final user = AppUser(displayName: "", id: "");
  final usecase = SignUpUsecaseImp(
    authDatasource: authMock,
    appRepository: repoMock,
  );

  test('It should have success in SING UP', () async {
    final dto = SignUpDto(email: "", password: "");
    when(() => authMock.signUp(dto)).thenAnswer((_) async => Tuple.right(user));

    when(() => repoMock.registerUser(user))
        .thenAnswer((_) async => Tuple.right(null));
    final response = await usecase.call(dto);

    expect(response.isRight(), true);
  });

  test('It should have an error in SING UP due AUTH', () async {
    final dto = SignUpDto(email: "2", password: "2");
    when(() => authMock.signUp(dto)).thenAnswer((_) async =>
        Tuple.left(ApiError(message: "", statusCode: 0, endpoint: "")));

    final response = await usecase.call(dto);

    expect(response.isLeft(), true);
  });

  test('It should have an error in SING UP due REPO', () async {
    final dto = SignUpDto(email: "2", password: "2");
    when(() => authMock.signUp(dto)).thenAnswer((_) async => Tuple.right(user));

    when(() => repoMock.registerUser(user))
        .thenAnswer((_) async => Tuple.left(RepositoryError(title: "")));
    final response = await usecase.call(dto);

    expect(response.isLeft(), true);
  });
}
