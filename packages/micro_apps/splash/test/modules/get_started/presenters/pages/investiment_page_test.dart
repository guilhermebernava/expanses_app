import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash/modules/get_started/presenters/pages/investiment_page.dart';
import 'package:splash/modules/get_started/presenters/widgets/lottie_box.dart';

void main() {
  testWidgets('It should create the widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(
        home: InvestimentPage(
      size: Size(200, 200),
    )));
    await tester.pumpAndSettle();
    expect(find.byType(InvestimentPage), findsOneWidget);
  });

  testWidgets('It should find the widgets', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(
        home: InvestimentPage(
      size: Size(200, 200),
    )));
    await tester.pumpAndSettle();
    expect(find.byType(LottieBox), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
  });
}
