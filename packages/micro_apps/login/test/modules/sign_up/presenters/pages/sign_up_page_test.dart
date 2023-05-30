import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/modules/sign_up/presenters/pages/sign_up_page.dart';
import 'package:login/modules/sign_up/presenters/widgets/sign_up_logo.dart';

void main() {
  testWidgets('It should create the widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(home: SignUpPage()));
    await tester.pumpAndSettle();
    expect(find.byType(SignUpPage), findsOneWidget);
  });

  testWidgets('It should find the widgets', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(home: SignUpPage()));
    await tester.pumpAndSettle();

    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(SignUpLogo), findsOneWidget);
    expect(find.byType(CommonInput), findsWidgets);
    expect(find.byType(CommonButtonText), findsOneWidget);
  });

  testWidgets('It should navigate', (tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(MaterialApp(
      home: const SignUpPage(),
      navigatorObservers: [mockObserver],
    ));
    await tester.pumpAndSettle();
    final t = find.byKey(const ValueKey("appBar"));
    await tester.tap(t);
    await tester.pumpAndSettle();
    expect(mockObserver.poppedRoutes.length, 1);
  });

  //TODO adicionar teste para tela seguinte
}
