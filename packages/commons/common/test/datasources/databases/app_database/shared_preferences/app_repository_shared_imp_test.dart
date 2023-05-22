import 'package:common/datasources/databases/app_database/app_repository.dart';
import 'package:common/datasources/databases/app_database/shared_preferences/app_repository_shared_imp.dart';
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

    final result = await appRepository.firstTimeApp();
    expect(result.isRight(), true);

    final response = await appRepository.isFirstTime();
    expect(response.isRight(), true);
    expect(response.right, false);
  });
}
