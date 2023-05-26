import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('It should show Error Snackbar and then Hide', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(home: Scaffold()));

    expect(find.byType(SnackBar), findsNothing);
    ShowErrorServices.showError(tester.element(find.byType(Scaffold)), "test");
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 10));
    expect(find.byType(SnackBar), findsNothing);
  });
}
