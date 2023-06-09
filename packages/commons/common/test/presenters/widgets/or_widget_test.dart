import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:common/presenters/widgets/or_widget.dart';

void main() {
  testWidgets('It should create widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester
        .pumpWidget(const MaterialApp(home: OrWidget(size: Size(100, 100))));
    await tester.pumpAndSettle();
    expect(find.byType(OrWidget), findsOneWidget);
  });
}
