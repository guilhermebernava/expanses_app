import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/modules/login/presenters/widgets/social_login_buttons.dart';
import 'package:mocktail/mocktail.dart';
import 'package:common/common.dart';

class GoogleAuthMock extends Mock implements GoogleAuthUsecase {}

void main() {
  testWidgets('It should create widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(
      MaterialApp(
        home: SocialLoginButtons(
          canPop: false,
          googleAuthUsecase: GoogleAuthMock(),
          size: const Size(100, 100),
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
      MaterialApp(
        home: SocialLoginButtons(
          canPop: false,
          googleAuthUsecase: GoogleAuthMock(),
          size: const Size(100, 100),
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
      MaterialApp(
        home: SocialLoginButtons(
          canPop: true,
          googleAuthUsecase: GoogleAuthMock(),
          size: const Size(100, 100),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(Container), findsOneWidget);
  });
}
