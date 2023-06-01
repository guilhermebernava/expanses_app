import 'package:common/infra/dtos/login_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('It should create an LOGIN DTO', () {
    final entitty = LoginDto(email: "", password: "");
    expect(entitty, isNotNull);
  });
}
