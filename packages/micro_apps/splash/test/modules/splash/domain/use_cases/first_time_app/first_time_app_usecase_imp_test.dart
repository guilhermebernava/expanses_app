import 'package:common/datasources/databases/app_database/shared_preferences/app_repository_shared_imp.dart';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash/modules/splash/domain/use_cases/first_time_app/first_time_app_usecase_imp.dart';

void main() {
  final usecase =
      FirstTimeAppUsecaseImp(appRepository: AppRepositorySharedImp());

  test('It should works fine', () async {
    Map<String, Object> values = <String, Object>{};
    SharedPreferences.setMockInitialValues(values);

    final result = await usecase.isFirstTime();
    expect(result.isRight(), true);
  });

  test('It should not work due to error in shared_preferences', () async {
    final result = await usecase.isFirstTime();
    expect(result.isLeft(), true);
  });
}
