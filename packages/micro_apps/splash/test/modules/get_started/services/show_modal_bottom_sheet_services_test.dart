import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:splash/modules/get_started/presenters/widgets/modal_bottom_sheet/modals/get_started_modal_bottom_sheet.dart';
import 'package:splash/modules/get_started/services/show_modal_bottom_sheet_services.dart';
import 'package:common/common.dart';

class GoogleMock extends Mock implements GoogleAuthUsecase {}

void main() {
  testWidgets('It should open modal bottom sheet', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(home: Scaffold()));
    await tester.pumpAndSettle();
    expect(find.byType(GetStartedModalBottomSheet), findsNothing);

    ShowModalBottomSheetServices.showGetStarted(
        tester.element(find.byType(Scaffold)),
        const Size(600, 600),
        GoogleMock());
    await tester.pumpAndSettle();
    expect(find.byType(GetStartedModalBottomSheet), findsOneWidget);
  });
}
