import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash/modules/splash/presenters/widgets/line_animation.dart';

void main() {
  testWidgets('It should create widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(home: LineAnimationWidget()));
    expect(find.byType(LineAnimationWidget), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 1));
  });
}
