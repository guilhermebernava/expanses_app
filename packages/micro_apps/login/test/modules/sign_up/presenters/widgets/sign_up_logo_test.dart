import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/modules/sign_up/presenters/widgets/sign_up_logo.dart';

void main() {
  testWidgets('It should create the widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(home: SignUpLogo()));
    expect(find.byType(SignUpLogo), findsOneWidget);
  });
}
