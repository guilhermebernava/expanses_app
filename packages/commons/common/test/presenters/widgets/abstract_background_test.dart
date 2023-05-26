import 'package:common/presenters/widgets/abstract_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('It should create the widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(const MaterialApp(
      home: AbstractBackground(
        image: "",
        size: Size(100, 100),
        children: [],
      ),
    ));

    expect(find.byType(Container), findsOneWidget);
  });
}
