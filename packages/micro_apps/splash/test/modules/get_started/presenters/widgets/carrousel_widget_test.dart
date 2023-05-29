import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash/modules/get_started/presenters/pages/keep_page.dart';
import 'package:splash/modules/get_started/presenters/widgets/carrousel_widget.dart';

void main() {
  testWidgets('It should create the widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(
      const MaterialApp(
        home: CarrouselWidget(
          height: 300,
          children: [
            KeepPage(
              size: Size(100, 100),
            ),
          ],
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(CarrouselWidget), findsOneWidget);
  });

  testWidgets('It should find widgets', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(
      const MaterialApp(
        home: CarrouselWidget(
          height: 300,
          children: [
            KeepPage(
              size: Size(100, 100),
            ),
          ],
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(KeepPage), findsOneWidget);
  });
}
