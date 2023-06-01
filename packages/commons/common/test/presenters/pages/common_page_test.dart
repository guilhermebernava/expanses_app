import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('It should create', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CommonPage(body: Container()),
    ));

    expect(find.byType(CommonPage), findsOneWidget);
  });

  testWidgets('It should find widgets', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CommonPage(body: Container()),
    ));

    expect(find.byType(CommonPage), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Padding), findsOneWidget);
  });
}
