import 'package:common/designs/app_colors.dart';
import 'package:common/presenters/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('It should create LogoWidget', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LogoWidget()));
    expect(find.byType(Column), findsOneWidget);
  });

  testWidgets('It should check LogoWidget colors', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LogoWidget()));
    final lines = find.byWidgetPredicate((widget) {
      if (widget is Container) {
        return widget.color == AppColors.primary;
      }
      return false;
    });

    final text = find.byWidgetPredicate((widget) {
      if (widget is Text) {
        return widget.style?.color == AppColors.white;
      }
      return false;
    });

    expect(lines, findsWidgets);
    expect(text, findsOneWidget);
  });
}
