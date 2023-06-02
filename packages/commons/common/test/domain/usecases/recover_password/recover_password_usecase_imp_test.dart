import 'package:common/common.dart';
import 'package:common/datasources/errors/api_error.dart';
import 'package:common/domain/usecases/recover_password/recover_password_usecase_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthServicesMock extends Mock implements AuthDatasource {}

void main() {
  final authMock = AuthServicesMock();
  final usecase = RecoverPasswordUsecaseImp(authDatasource: authMock);

  test('It should works fine', () async {
    const email = "b@a.com";
    when(() => authMock.forgotPassword(email))
        .thenAnswer((invocation) async => Tuple.right(null));

    final result = await usecase.call(email);
    expect(result.isRight(), true);
  });

  test('It should have an error due AUTH fine', () async {
    const email = "a@a.com";
    when(() => authMock.forgotPassword(email)).thenAnswer((invocation) async =>
        Tuple.left(ApiError(endpoint: "", message: "", statusCode: 0)));

    final result = await usecase.call(email);
    expect(result.isLeft(), true);
  });
}
