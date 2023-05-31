import 'package:common/datasources/databases/app_database/secure_storage/app_repository_secure_imp.dart';
import 'package:common/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  final repository = AppRepositorySecureImp();

  test('It should get an error when delete due not existent user', () async {
    FlutterSecureStorage.setMockInitialValues({});

    final response = await repository.deleteUser();
    expect(response.isLeft(), true);
  });

  test('It should delete user', () async {
    FlutterSecureStorage.setMockInitialValues({
      "user": '''
{
  "id": "123",
  "display_name": "Guilherme",
  "image_url": "image"
}
'''
    });

    await repository.registerUser(AppUser(displayName: "", id: ""));
    final response = await repository.deleteUser();

    expect(response.isRight(), true);
  });

  test('It should register user', () async {
    FlutterSecureStorage.setMockInitialValues({});
    final response =
        await repository.registerUser(AppUser(displayName: "", id: ""));
    expect(response.isRight(), true);
  });

  test('It should have an error when register user', () async {
    final response =
        await repository.registerUser(AppUser(displayName: "", id: ""));
    expect(response.isLeft(), true);
  });

  test('It should be the firstTime', () async {
    FlutterSecureStorage.setMockInitialValues({});
    final response = await repository.isFirstTime();
    expect(response.isRight(), true);
    expect(response.right, true);
  });

  test('It should not be the firstTime', () async {
    FlutterSecureStorage.setMockInitialValues({"first-time": "true"});
    final response = await repository.isFirstTime();
    expect(response.isRight(), true);
    expect(response.right, false);
  });

  test('It should get an user', () async {
    FlutterSecureStorage.setMockInitialValues({
      "user": '''
{
  "id": "123",
  "display_name": "Guilherme",
  "image_url": "image"
}
'''
    });
    final user = await repository.getUser();

    expect(user.isRight(), true);
  });

  test('It should have an error when get an user', () async {
    final user = await repository.getUser();
    expect(user.isLeft(), true);
  });
}
