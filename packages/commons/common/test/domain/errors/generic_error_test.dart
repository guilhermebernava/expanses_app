import 'package:common/domain/errors/generic_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('It should create an GENERIC ERROR', () {
    final entity = GenericError(message: "");
    expect(entity, isNotNull);
  });
}
