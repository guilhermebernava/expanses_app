import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/modules/choice_sign/presenters/choice_sign_page.dart';
import 'package:mocktail/mocktail.dart';
import 'package:common/common.dart';

class GoogleMock extends Mock implements GoogleAuthUsecase {}

void main() {
  testWidgets('It should create the widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(
        MaterialApp(home: ChoiceSignPage(googleAuthUsecase: GoogleMock())));
    await tester.pumpAndSettle();
    expect(find.byType(ChoiceSignPage), findsOneWidget);
  });

  //TODO implementar testes para tela
}
