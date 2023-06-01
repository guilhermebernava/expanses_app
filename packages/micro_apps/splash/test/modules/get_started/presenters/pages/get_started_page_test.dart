import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:common/common.dart';
import 'package:mocktail/mocktail.dart';
import 'package:splash/modules/get_started/presenters/pages/get_started_page.dart';
import 'package:splash/modules/get_started/presenters/widgets/carrousel_widget.dart';

class GoogleMock extends Mock implements GoogleAuthUsecase {}

void main() {
  testWidgets('It should create the widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(
      MaterialApp(
        home: GetStartedPage(
          googleAuthUsecase: GoogleMock(),
          userBloc: UserBloc(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(GetStartedPage), findsOneWidget);
  });

  testWidgets('It should find the widgets', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(MaterialApp(
        home: GetStartedPage(
      googleAuthUsecase: GoogleMock(),
      userBloc: UserBloc(),
    )));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    expect(find.byType(CarrouselWidget), findsOneWidget);
    expect(find.byType(CommonButtonText), findsOneWidget);
  });

  testWidgets('It should open the ModalBottomSheet', (tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(MaterialApp(
      home: GetStartedPage(
        googleAuthUsecase: GoogleMock(),
        userBloc: UserBloc(),
      ),
      navigatorObservers: [mockObserver],
    ));

    await tester.pumpAndSettle();
    final t = find.byType(CommonButtonText);
    await tester.tap(t);
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.byType(GetStartedModalBottomSheet), findsOneWidget);
  });
}
