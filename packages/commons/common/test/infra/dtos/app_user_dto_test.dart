import 'package:common/domain/entities/user.dart';
import 'package:common/infra/dtos/app_user_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const json = '''
{
  "id": "123",
  "display_name": "Guilherme",
  "image_url": "image"
}
''';

  test('It should decode the JSON', () async {
    final user = AppUserDto.fromJson(json);
    expect(user, isA<AppUser>());
  });

  test('It should decode the JSON', () async {
    final data = AppUserDto.toJson(AppUser(displayName: "", id: ""));
    expect(data, isA<String>());
  });
}
