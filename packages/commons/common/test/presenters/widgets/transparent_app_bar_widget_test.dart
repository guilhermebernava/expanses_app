import 'package:common/mocks/mock_navigator_observer.dart';
import 'package:common/presenters/widgets/transparent_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('It should create the widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(const MaterialApp(home: TransparentAppBarWidget()));
    expect(find.byType(Row), findsOneWidget);
  });

  testWidgets('It should check onTap', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    bool clicked = false;
    await tester.pumpWidget(MaterialApp(home: TransparentAppBarWidget(
      onTap: () {
        clicked = true;
      },
    )));

    final button = find.byType(GestureDetector);
    await tester.tap(button);
    await tester.pump();
    expect(clicked, true);
  });

  testWidgets("It should pop route", (tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(MaterialApp(
      home: const TransparentAppBarWidget(),
      navigatorObservers: [mockObserver],
    ));

    await tester.tap(find.byKey(const ValueKey("appBar")));
    await tester.pumpAndSettle();
    expect(mockObserver.poppedRoutes.length, 1);
  });
}
