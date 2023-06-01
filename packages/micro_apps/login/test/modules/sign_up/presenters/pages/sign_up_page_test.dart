import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/modules/sign_up/presenters/controllers/sign_up_page_controller.dart';
import 'package:login/modules/sign_up/presenters/pages/sign_up_page.dart';
import 'package:login/modules/sign_up/presenters/widgets/sign_up_logo.dart';
import 'package:mocktail/mocktail.dart';

class SignUpMock extends Mock implements SignUpUsecase {}

void main() {
  final signUpMock = SignUpMock();
  registerFallbackValue(SignUpDto(email: "", password: ""));

  testWidgets('It should create the widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(MaterialApp(
        home: SignUpPage(
      controller: SignUpPageController(
        signUpUsecase: signUpMock,
      ),
    )));
    await tester.pumpAndSettle();
    expect(find.byType(SignUpPage), findsOneWidget);
  });

  testWidgets('It should find the widgets', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(
      MaterialApp(
        home: SignUpPage(
          controller: SignUpPageController(
            signUpUsecase: signUpMock,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(SignUpLogo), findsOneWidget);
    expect(find.byType(CommonInput), findsWidgets);
    expect(find.byType(CommonButtonText), findsOneWidget);
  });

  testWidgets('It should navigate', (tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(MaterialApp(
      home: SignUpPage(
        controller: SignUpPageController(
          signUpUsecase: signUpMock,
        ),
      ),
      navigatorObservers: [mockObserver],
    ));
    await tester.pumpAndSettle();
    final t = find.byKey(const ValueKey("appBar"));
    await tester.tap(t);
    await tester.pumpAndSettle();
    expect(mockObserver.poppedRoutes.length, 1);
  });

  testWidgets('It should navigate to HOME', (tester) async {
    final controller = SignUpPageController(
      signUpUsecase: signUpMock,
    );
    controller.model.email.set("a@a.com");
    controller.model.password.set("asdf1904");
    controller.model.confirmPassword.set("asdf190");

    await tester.pumpWidget(MaterialApp(
      home: SignUpPage(controller: controller),
      routes: {
        AppRoutes.home: (context) => Container(),
      },
    ));
    await tester.pumpAndSettle();
    when(() => signUpMock(any())).thenAnswer(
        (invocation) async => Tuple.right(AppUser(displayName: "", id: "")));
    final button = find.byKey(const ValueKey("SIGN_UP"));
    await tester.ensureVisible(button);
    await tester.tap(button);
    await tester.pumpAndSettle(const Duration(seconds: 10));

    expect(find.byType(Container), findsOneWidget);
  });
}
