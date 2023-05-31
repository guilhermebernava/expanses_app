import 'package:common/datasources/errors/api_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('It should create a api error', () {
    final entity = ApiError(endpoint: "", message: "", statusCode: 0);
    expect(entity, isA<ApiError>());
  });
}
