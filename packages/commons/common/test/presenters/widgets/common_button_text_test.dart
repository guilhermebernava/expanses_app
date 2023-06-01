import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('It should create common button', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(MaterialApp(
      home: CommonButtonText(
        width: double.infinity,
        onTap: () async {},
        text: "test",
      ),
    ));

    expect(find.byKey(const ValueKey("test")), findsOneWidget);
  });

  testWidgets('It should create a safe button', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(MaterialApp(
      home: CommonButtonText.safeButton(
        width: double.infinity,
        onTap: () async {},
        text: "test",
      ),
    ));

    expect(find.byKey(const ValueKey("test")), findsOneWidget);
  });

  testWidgets('It should onTap works', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    bool executed = false;
    await tester.pumpWidget(MaterialApp(
      home: CommonButtonText(
        width: double.infinity,
        onTap: () async {
          executed = true;
        },
        text: "test",
      ),
    ));

    final button = find.byKey(const ValueKey("test"));
    await tester.tap(button);
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.pump();
    expect(executed, true);
  });

  testWidgets('It should be primary color', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(MaterialApp(
      home: CommonButtonText(
        width: double.infinity,
        onTap: () async {},
        text: "test",
      ),
    ));

    final widgetFinder = find.byWidgetPredicate((widget) {
      if (widget is Material) {
        return widget.color == AppColors.primary;
      }
      return false;
    });

    expect(widgetFinder, findsOneWidget);
  });

  testWidgets('It should be transparente', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(MaterialApp(
      home: CommonButtonText(
        width: double.infinity,
        onTap: () async {},
        text: "test",
        isReverseColor: true,
      ),
    ));

    final widgetFinder = find.byWidgetPredicate((widget) {
      if (widget is Material) {
        return widget.color == Colors.transparent;
      }
      return false;
    });

    expect(widgetFinder, findsOneWidget);
  });
}
