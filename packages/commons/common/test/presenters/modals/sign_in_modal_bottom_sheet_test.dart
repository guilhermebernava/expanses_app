import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GoogleMock extends Mock implements GoogleAuthUsecase {}

void main() {
  testWidgets('It should open and close modal bottom sheet', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(home: Scaffold()));
    await tester.pumpAndSettle();
    expect(find.byType(SignInModalBottomSheet), findsNothing);

    ShowModalBottomSheetServices.showSignIn(
      tester.element(find.byType(Scaffold)),
      const Size(1400, 1000),
      GoogleMock(),
      UserBloc(),
    );
    await tester.pumpAndSettle();
    expect(find.byType(SignInModalBottomSheet), findsOneWidget);

    await tester.tapAt(const Offset(20.0, 20.0));
    await tester.pumpAndSettle();
    expect(find.byType(SignInModalBottomSheet), findsNothing);
  });

  testWidgets('It should find widgets', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(home: Scaffold()));
    await tester.pumpAndSettle();
    ShowModalBottomSheetServices.showSignIn(
      tester.element(find.byType(Scaffold)),
      const Size(600, 600),
      GoogleMock(),
      UserBloc(),
    );
    await tester.pumpAndSettle();

    expect(find.text("Sign In with Email"), findsOneWidget);
    expect(find.text("Sign In with Google"), findsOneWidget);
    expect(find.text("Sign In with Github"), findsOneWidget);
  });
}
