import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/modules/sign_up/presenters/controllers/sign_up_page_controller.dart';
import 'package:login/modules/sign_up/presenters/pages/sign_up_page.dart';
import 'package:login/modules/sign_up/presenters/widgets/sign_up_logo.dart';

void main() {
  testWidgets('It should create the widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(MaterialApp(
        home: SignUpPage(
      controller: SignUpPageController(),
    )));
    await tester.pumpAndSettle();
    expect(find.byType(SignUpPage), findsOneWidget);
  });

  testWidgets('It should find the widgets', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(
      MaterialApp(
        home: SignUpPage(
          controller: SignUpPageController(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(SignUpLogo), findsOneWidget);
    expect(find.byType(CommonInput), findsWidgets);
    expect(find.byType(CommonButtonText), findsOneWidget);
  });

  testWidgets('It should navigate', (tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(MaterialApp(
      home: SignUpPage(
        controller: SignUpPageController(),
      ),
      navigatorObservers: [mockObserver],
    ));
    await tester.pumpAndSettle();
    final t = find.byKey(const ValueKey("appBar"));
    await tester.tap(t);
    await tester.pumpAndSettle();
    expect(mockObserver.poppedRoutes.length, 1);
  });

  testWidgets('It should navigate to HOME', (tester) async {
    //TODO atualizar teste com USECASE
    await tester.pumpWidget(MaterialApp(
      home: SignUpPage(
        controller: SignUpPageController(),
      ),
      routes: {
        AppRoutes.home: (context) => Container(),
      },
    ));
    await tester.pumpAndSettle();
    final button = find.byKey(const ValueKey("SIGN_UP"));
    await tester.ensureVisible(button);
    await tester.tap(button);

    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.byType(Container), findsOneWidget);
  });
}
