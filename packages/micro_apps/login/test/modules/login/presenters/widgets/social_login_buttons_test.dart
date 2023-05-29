import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/modules/login/presenters/widgets/social_login_buttons.dart';

void main() {
  testWidgets('It should create widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(
      const MaterialApp(
        home: SocialLoginButtons(
          canPop: false,
          size: Size(100, 100),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(SocialLoginButtons), findsOneWidget);
  });

  testWidgets('It should if CAN_POP is FALSE show a COLUMN with BUTTONS',
      (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(
      const MaterialApp(
        home: SocialLoginButtons(
          canPop: false,
          size: Size(100, 100),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(Column), findsOneWidget);
  });

  testWidgets('It should if CAN_POP is TRUE show a EMPTY CONTAINER',
      (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(
      const MaterialApp(
        home: SocialLoginButtons(
          canPop: true,
          size: Size(100, 100),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(Container), findsOneWidget);
  });
}
