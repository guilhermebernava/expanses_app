import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:splash/modules/get_started/presenters/widgets/modal_bottom_sheet/modals/get_started_modal_bottom_sheet.dart';
import 'package:splash/modules/get_started/services/show_modal_bottom_sheet_services.dart';

class GoogleMock extends Mock implements GoogleAuthUsecase {}

void main() {
  testWidgets('It should open and close modal bottom sheet', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(home: Scaffold()));
    await tester.pumpAndSettle();
    expect(find.byType(GetStartedModalBottomSheet), findsNothing);

    ShowModalBottomSheetServices.showGetStarted(
      tester.element(find.byType(Scaffold)),
      const Size(600, 600),
      GoogleMock(),
    );
    await tester.pumpAndSettle();
    expect(find.byType(GetStartedModalBottomSheet), findsOneWidget);

    await tester.tapAt(const Offset(20.0, 20.0));
    await tester.pumpAndSettle();
    expect(find.byType(GetStartedModalBottomSheet), findsNothing);
  });

  testWidgets('It should find widgets', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(home: Scaffold()));
    await tester.pumpAndSettle();
    ShowModalBottomSheetServices.showGetStarted(
      tester.element(find.byType(Scaffold)),
      const Size(600, 600),
      GoogleMock(),
    );
    await tester.pumpAndSettle();

    expect(find.text("Sign In"), findsOneWidget);
    expect(find.text("Sign Up"), findsOneWidget);
  });
}
