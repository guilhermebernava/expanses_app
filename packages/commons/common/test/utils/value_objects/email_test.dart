import 'package:common/utils/value_objects/email.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('It should create an EMAIL', () {
    final email = Email("");

    expect(email, isNotNull);
    expect(email, isA<Email>());
  });

  test('It should not have en error message', () {
    final email = Email("guilherme@teste.com");

    final response = email.validator();
    expect(response, isNull);
  });

  test('It should have en error message', () {
    final email = Email("guilherme@testecom");

    final response = email.validator();
    expect(response, isNotNull);
  });

  test('It should put the new value into EMAIL', () {
    final email = Email("");
    expect(email.value, "");

    email.call("a@a.com");
    expect(email.value, "a@a.com");
  });

  test('It should put "" when passed NULL value', () {
    final email = Email("");
    expect(email.value, "");

    email.call(null);
    expect(email.value, "");
  });
}
