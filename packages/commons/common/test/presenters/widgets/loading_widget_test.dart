import 'package:common/presenters/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('It should create the widget', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoadingWidget(),
      ),
    );
    expect(find.byType(LoadingWidget), findsOneWidget);
  });
}
