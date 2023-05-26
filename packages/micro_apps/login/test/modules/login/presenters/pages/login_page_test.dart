import 'package:common/common.dart';
import 'package:common/mocks/mock_navigator_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/modules/login/presenters/pages/login_page.dart';
import 'package:login/modules/login/presenters/widgets/login_input.dart';

void main() {
  testWidgets('It should create the widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));
    expect(find.byType(LoginPage), findsOneWidget);
  });

  testWidgets('It should find the widgets', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(LogoWidget), findsOneWidget);
    expect(find.byType(LoginInput), findsWidgets);
    expect(find.byType(CommonButton), findsOneWidget);
  });

  testWidgets('It should find the widgets', (tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(MaterialApp(
      home: const LoginPage(),
      navigatorObservers: [mockObserver],
    ));

    await tester.tap(find.byType(TransparentAppBarWidget));
    await tester.pumpAndSettle();
    expect(mockObserver.poppedRoutes.length, 1);
  });
}
