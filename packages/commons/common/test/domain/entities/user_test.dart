import 'package:common/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('It should create an user', () async {
    final user = AppUser(displayName: "display", id: "1");
    expect(user, isA<AppUser>());
  });
}
