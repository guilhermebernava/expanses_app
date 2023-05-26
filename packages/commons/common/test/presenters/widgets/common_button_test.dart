import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('It should create common button', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(MaterialApp(
      home: CommonButton(
        onTap: () {},
        text: "test",
      ),
    ));

    expect(find.byKey(const ValueKey("test")), findsOneWidget);
  });

  testWidgets('It should create common button', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(MaterialApp(
      home: CommonButton(
        onTap: () {},
        text: "test",
      ),
    ));

    final button = find.byKey(const ValueKey("test"));

    tester.tap(button);
    await tester.pump();
  });
}
