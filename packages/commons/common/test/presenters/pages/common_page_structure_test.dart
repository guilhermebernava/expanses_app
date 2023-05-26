import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('It should create the widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(
      MaterialApp(
        home: CommonPageStructure(
          size: const Size(100, 100),
          body: Container(),
        ),
      ),
    );

    expect(find.byType(Scaffold), findsOneWidget);
  });

  testWidgets('It should find the widgets', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(
      MaterialApp(
        home: CommonPageStructure(
          size: const Size(100, 100),
          body: Container(),
        ),
      ),
    );

    expect(find.byType(TransparentAppBarWidget), findsOneWidget);
    expect(find.byType(Expanded), findsOneWidget);
    expect(find.byType(AbstractBackground), findsOneWidget);
  });

  testWidgets(
      'It should throw assertion error when both BODY and CONTAINER are NULL',
      (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    try {
      await tester.pumpWidget(
        MaterialApp(
          home: CommonPageStructure(
            size: const Size(100, 100),
          ),
        ),
      );
    } catch (e) {
      expect(e, isA<AssertionError>());
    }
  });
}
