import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('It should create a repository error', () {
    final entity = RepositoryError(title: "teste");
    expect(entity, isA<RepositoryError>());
  });
}
