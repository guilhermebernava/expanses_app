import 'package:common/common.dart';
import 'package:common/datasources/errors/api_error.dart';
import 'package:common/domain/usecases/sign_up/sign_up_usecase_imp.dart';
import 'package:common/infra/dtos/sign_up_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthMock extends Mock implements AuthDatasource {}

void main() {
  final authMock = AuthMock();
  final usecase = SignUpUsecaseImp(authDatasource: authMock);

  test('It should have success in SING UP', () async {
    final dto = SignUpDto(email: "", password: "");
    when(() => authMock.signUp(dto))
        .thenAnswer((_) async => Tuple.right(AppUser(displayName: "", id: "")));
    final response = await usecase.call(dto);

    expect(response.isRight(), true);
  });

  test('It should have an error in SING UP', () async {
    final dto = SignUpDto(email: "2", password: "2");
    when(() => authMock.signUp(dto)).thenAnswer((_) async =>
        Tuple.left(ApiError(message: "", statusCode: 0, endpoint: "")));
    final response = await usecase.call(dto);

    expect(response.isLeft(), true);
  });
}
