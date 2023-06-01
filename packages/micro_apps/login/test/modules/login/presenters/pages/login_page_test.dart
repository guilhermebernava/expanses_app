import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/modules/login/presenters/controllers/login_page_controller.dart';
import 'package:login/modules/login/presenters/pages/login_page.dart';
import 'package:mocktail/mocktail.dart';
import 'package:common_dependencies/common_dependencies.dart';

class AuthServicesMock extends Mock implements AuthDatasource {}

class AppRepositoryMock extends Mock implements AppRepository {}

class EmailAuthMock extends Mock implements EmailAuthUsecase {}

void main() {
  FlutterSecureStorage.setMockInitialValues({
    "user": '''
{
  "id": "123",
  "display_name": "Guilherme",
  "image_url": "image"
}
'''
  });
  final authMock = AuthServicesMock();
  final repostioryMock = AppRepositoryMock();

  setUpAll(() {
    registerFallbackValue(LoginDto(email: "a@a.com", password: "123"));
    registerFallbackValue(AppUser(displayName: "", id: ""));
    when(() => authMock.loginEmail(any()))
        .thenAnswer((invocation) async => Tuple.right(any()));

    when(() => repostioryMock.registerUser(any()))
        .thenAnswer((invocation) async => Tuple.right(null));
  });

  testWidgets('It should create the widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(
      MaterialApp(
        home: LoginPage(
          controller: LoginPageController(
            emailAuthUsecase: EmailAuthMock(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(LoginPage), findsOneWidget);
  });

  testWidgets('It should find the widgets', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(
      MaterialApp(
        home: LoginPage(
          controller: LoginPageController(
            emailAuthUsecase: EmailAuthMock(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(LogoWidget), findsOneWidget);
    expect(find.byType(CommonInput), findsWidgets);
    expect(find.byType(CommonButtonText), findsOneWidget);
  });

  testWidgets('It should navigate', (tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(MaterialApp(
      home: const Scaffold(),
      routes: {
        AppRoutes.signIn: (_) => LoginPage(
              controller: LoginPageController(
                emailAuthUsecase: EmailAuthMock(),
              ),
            ),
      },
      navigatorObservers: [mockObserver],
    ));

    Navigator.pushNamed(
        tester.element(find.byType(Scaffold)), AppRoutes.signIn);
    await tester.pumpAndSettle();
    final t = find.byKey(const ValueKey("appBar"));
    await tester.tap(t);
    await tester.pump();
    expect(mockObserver.poppedRoutes.length, 1);
  });
}
