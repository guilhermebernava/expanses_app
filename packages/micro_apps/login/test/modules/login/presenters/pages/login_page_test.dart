import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/modules/login/presenters/pages/login_page.dart';
import 'package:mocktail/mocktail.dart';

class GoogleMock extends Mock implements GoogleAuthUsecase {}

void main() {
  testWidgets('It should create the widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(
        MaterialApp(home: LoginPage(googleAuthUsecase: GoogleMock())));
    await tester.pumpAndSettle();
    expect(find.byType(LoginPage), findsOneWidget);
  });

  testWidgets('It should find the widgets', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(
        MaterialApp(home: LoginPage(googleAuthUsecase: GoogleMock())));
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
        AppRoutes.signIn: (_) => LoginPage(googleAuthUsecase: GoogleMock()),
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

  //TODO criar teste para validar próxima tela
  // testWidgets('It should check if button is working', (tester) async {
  //   final mockObserver = MockNavigatorObserver();
  //   await tester.pumpWidget(MaterialApp(
  //     home: const LoginPage(),
  //     navigatorObservers: [mockObserver],
  //   ));
  //   await tester.pumpAndSettle();
  //   final button = find.byType(CommonButton);

  //   await tester.tap(button);
  // });
}
