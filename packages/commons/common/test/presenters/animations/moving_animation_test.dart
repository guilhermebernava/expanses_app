import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('It should create the widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(
      MaterialApp(
        home: MovingAnimation(
          child: Container(),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.byType(MovingAnimation), findsOneWidget);
  });
}
