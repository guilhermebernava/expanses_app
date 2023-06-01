import 'package:common/infra/dtos/sign_up_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('It should create an SIGN UP DTO', () {
    final entitty = SignUpDto(email: "", password: "");
    expect(entitty, isNotNull);
  });
}
