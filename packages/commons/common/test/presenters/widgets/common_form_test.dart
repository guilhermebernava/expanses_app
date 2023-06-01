import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('It should create', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CommonForm(
          formKey: GlobalKey<FormState>(),
          children: const [],
        ),
      ),
    );

    expect(find.byType(CommonForm), findsOneWidget);
  });

  testWidgets('It should find widgets', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CommonForm(
          formKey: GlobalKey<FormState>(),
          children: const [],
        ),
      ),
    );

    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Padding), findsWidgets);
  });
}
