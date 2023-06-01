import 'package:common/utils/value_objects/password.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('It should create an PASSWORD', () {
    final password = Password("");

    expect(password, isNotNull);
    expect(password, isA<Password>());
  });

  test('It should not have en error message', () {
    final password = Password("aaaAaa1");

    final response = password.validator();
    expect(response, isNull);
  });

  test('It should have an error message', () {
    final password = Password("aaa");

    final response = password.validator();
    expect(response, isNotNull);
  });

  test('It should not have an error message due to desactivated validation',
      () {
    final password = Password("aaa", validatePassword: false);

    final response = password.validator();
    expect(response, isNull);
  });

  test('It should put the new value into PASSWORD', () {
    final password = Password("");
    expect(password.value, "");

    password.call("123");
    expect(password.value, "123");
  });

  test('It should put "" when passed NULL value', () {
    final password = Password("");
    expect(password.value, "");

    password.call(null);
    expect(password.value, "");
  });
}
