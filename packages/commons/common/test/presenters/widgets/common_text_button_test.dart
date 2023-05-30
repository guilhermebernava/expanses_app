import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('It should create common text button', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(MaterialApp(
      home: CommonTextButton(
        onTap: () async {},
        text: "test",
      ),
    ));

    expect(find.byKey(const ValueKey("test")), findsOneWidget);
  });

  testWidgets('It should click in  common text button', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    bool clicked = false;

    await tester.pumpWidget(MaterialApp(
      home: CommonTextButton(
        onTap: () async {
          clicked = true;
        },
        text: "test",
      ),
    ));

    await tester.tap(find.byKey(const ValueKey("test")));
    expect(clicked, true);
  });
}
