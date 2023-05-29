import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash/modules/splash/presenters/widgets/text_animated.dart';

void main() {
  testWidgets('It should create widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(home: TextAnimated()));
    expect(find.byType(TextAnimated), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 1));
  });
}
