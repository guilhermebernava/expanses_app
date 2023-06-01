import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:common/common.dart';
import 'package:splash/modules/splash/domain/use_cases/get_user/get_user_usecase_imp.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppRepositoryMock extends Mock implements AppRepository {}

void main() {
  final repositoryMock = AppRepositoryMock();
  final usecase = GetUserUsecaseImp(appRepository: repositoryMock);

  setUpAll(() {
    FlutterSecureStorage.setMockInitialValues({});
  });

  test('It should get an APP USER', () async {
    when(() => repositoryMock.getUser()).thenAnswer(
        (invocation) async => Tuple.right(AppUser(displayName: "", id: "")));

    final response = await usecase.call();
    expect(response.isRight(), true);
    expect(response.right, isA<AppUser>());
  });

  test('It should have an error when not get an APP USER', () async {
    when(() => repositoryMock.getUser()).thenAnswer(
        (invocation) async => Tuple.left(RepositoryError(title: "")));

    final response = await usecase.call();
    expect(response.isLeft(), true);
  });
}
