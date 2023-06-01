import 'package:common/datasources/databases/app_database/app_repository.dart';
import 'package:common/datasources/databases/app_database/shared_preferences/app_repository_shared_imp.dart';
import 'package:common/domain/entities/user.dart';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final AppRepository appRepository = AppRepositorySharedImp();

  test('It should first time open the app', () async {
    Map<String, Object> values = <String, Object>{};
    SharedPreferences.setMockInitialValues(values);

    final result = await appRepository.isFirstTime();
    expect(result.isRight(), true);
    expect(result.right, true);
  });

  test('It should NOT be first time open the app', () async {
    Map<String, Object> values = <String, Object>{
      "first-time": false,
    };
    SharedPreferences.setMockInitialValues(values);

    final result = await appRepository.isFirstTime();
    expect(result.isRight(), true);
    expect(result.right, false);
  });

  test('It should update app DB after open the app for first time', () async {
    Map<String, Object> values = <String, Object>{};
    SharedPreferences.setMockInitialValues(values);

    final response = await appRepository.isFirstTime();
    expect(response.isRight(), true);
    expect(response.right, true);
  });

  test('It should NOT find an user', () async {
    Map<String, Object> values = <String, Object>{};
    SharedPreferences.setMockInitialValues(values);

    final result = await appRepository.getUser();
    expect(result.isLeft(), true);
  });

  test('It should  find an user', () async {
    Map<String, Object> values = <String, Object>{
      "user": '''
{
  "id": "123",
  "display_name": "Guilherme",
  "image_url": "image"
}
'''
    };
    SharedPreferences.setMockInitialValues(values);

    final result = await appRepository.getUser();
    expect(result.isRight(), true);
    expect(result.right, isA<AppUser>());
  });

  test('It should register an user', () async {
    Map<String, Object> values = <String, Object>{};
    SharedPreferences.setMockInitialValues(values);

    final result =
        await appRepository.registerUser(AppUser(displayName: "", id: ""));
    expect(result.isRight(), true);
  });

  test('It should update a registerd  user', () async {
    Map<String, Object> values = <String, Object>{
      "user": '''
{
  "id": "123",
  "display_name": "Guilherme",
  "image_url": "image"
}
'''
    };
    SharedPreferences.setMockInitialValues(values);

    final result = await appRepository
        .registerUser(AppUser(displayName: "Bernava", id: ""));
    expect(result.isRight(), true);

    final user = await appRepository.getUser();
    expect(user.isRight(), true);
    expect(user.right.displayName, "Bernava");
  });

  test('It should delete an user', () async {
    Map<String, Object> values = <String, Object>{
      "user": '''
{
  "id": "123",
  "display_name": "Guilherme",
  "image_url": "image"
}
'''
    };
    SharedPreferences.setMockInitialValues(values);

    final result = await appRepository.deleteUser();
    expect(result.isRight(), true);
  });

  test('It should not have an error when do not have an user to delete',
      () async {
    Map<String, Object> values = <String, Object>{};
    SharedPreferences.setMockInitialValues(values);

    final result = await appRepository.deleteUser();
    expect(result.isRight(), true);
  });
}
