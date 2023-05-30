import 'package:common/datasources/errors/api_error.dart';
import 'package:common/domain/entities/user.dart';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:common/common.dart';
import 'package:mocktail/mocktail.dart';

class AuthServicesMock extends Mock implements AuthDatasource {}

class AppRepositoryMock extends Mock implements AppRepository {}

void main() {
  setUpAll(() {
    Map<String, Object> values = <String, Object>{};
    SharedPreferences.setMockInitialValues(values);
  });
  final authMock = AuthServicesMock();
  final repostioryMock = AppRepositoryMock();

  final usecase = GoogleAuthUsecaseImp(
    authDatasource: authMock,
    appRepository: repostioryMock,
  );

  testWidgets('It should not show message error when have success login in',
      (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(MaterialApp(home: Container()));
    final context = tester.element(find.byType(Container));
    final user = AppUser(displayName: "", id: "");
    when(() => authMock.loginGoogle())
        .thenAnswer((invocation) async => Tuple.right(user));

    when(() => repostioryMock.registerUser(user))
        .thenAnswer((invocation) async => Tuple.right(null));

    await usecase.call(context);
    expect(find.byKey(const ValueKey("Error_Snackbar")), findsNothing);
  });

  testWidgets('It should show message error when LOGIN GOOGLE has an ERROR',
      (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(home: Scaffold()));
    final context = tester.element(find.byType(Scaffold));

    when(() => authMock.loginGoogle()).thenAnswer((invocation) async =>
        Tuple.left(
            ApiError(endpoint: "", message: "google_login", statusCode: 100)));

    await usecase.call(context);
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey("Error_Snackbar")), findsOneWidget);
    expect(find.text("google_login"), findsOneWidget);
  });

  testWidgets('It should show message error when APP_REPOSITORY has an ERROR',
      (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(home: Scaffold()));
    final context = tester.element(find.byType(Scaffold));
    final user = AppUser(displayName: "", id: "");

    when(() => authMock.loginGoogle())
        .thenAnswer((invocation) async => Tuple.right(user));

    when(() => repostioryMock.registerUser(user)).thenAnswer(
        (invocation) async => Tuple.left(SharedError(title: 'shared_error')));

    await usecase.call(context);
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey("Error_Snackbar")), findsOneWidget);
    expect(find.text("shared_error"), findsOneWidget);
  });
}
