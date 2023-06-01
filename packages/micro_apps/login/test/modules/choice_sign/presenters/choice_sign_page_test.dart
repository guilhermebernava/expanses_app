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
      MaterialApp(
        home: ChoiceSignPage(
          googleAuthUsecase: GoogleMock(),
          userBloc: UserBloc(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(ChoiceSignPage), findsOneWidget);
  });

  group("GET STARTED BOTTOM MODAL", () {
    testWidgets('It should open the ModalBottomSheet', (tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: ChoiceSignPage(
          googleAuthUsecase: GoogleMock(),
          userBloc: UserBloc(),
        ),
        navigatorObservers: [mockObserver],
      ));

      await tester.pumpAndSettle();
      final t = find.byType(CommonButtonText);
      await tester.tap(t);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(GetStartedModalBottomSheet), findsOneWidget);
    });

    testWidgets('It should Navigate to SIGN UP', (tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: ChoiceSignPage(
          googleAuthUsecase: GoogleMock(),
          userBloc: UserBloc(),
        ),
        routes: {
          AppRoutes.signUp: (context) => Container(),
        },
        navigatorObservers: [mockObserver],
      ));

      await tester.pumpAndSettle();
      final t = find.byType(CommonButtonText);
      await tester.tap(t);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(GetStartedModalBottomSheet), findsOneWidget);

      await tester.tap(find.text("SIGN UP"));
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('It should OPEN to SIGN IN MODAL BOTTOM', (tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: ChoiceSignPage(
          googleAuthUsecase: GoogleMock(),
          userBloc: UserBloc(),
        ),
        navigatorObservers: [mockObserver],
      ));

      await tester.pumpAndSettle();
      final t = find.byType(CommonButtonText);
      await tester.tap(t);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(GetStartedModalBottomSheet), findsOneWidget);

      await tester.tap(find.text("SIGN IN"));
      await tester.pumpAndSettle();

      expect(find.byType(SignInModalBottomSheet), findsOneWidget);
    });
  });

  group("SIGN IN BOTTOM MODAL", () {
    testWidgets('It should Navigate to SIGN IN page', (tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: ChoiceSignPage(
          googleAuthUsecase: GoogleMock(),
          userBloc: UserBloc(),
        ),
        routes: {
          AppRoutes.signIn: (context) => const Text("sign_ing"),
        },
        navigatorObservers: [mockObserver],
      ));

      await tester.pumpAndSettle();
      final t = find.byType(CommonButtonText);
      await tester.tap(t);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(GetStartedModalBottomSheet), findsOneWidget);

      await tester.tap(find.text("SIGN IN"));
      await tester.pumpAndSettle();

      expect(find.byType(SignInModalBottomSheet), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey("SIGN_IN")));

      final exist = mockObserver.pushedRoutes
          .firstWhere((element) => element.settings.name == AppRoutes.signIn);
      expect(exist, isNotNull);
    });

    testWidgets('It should Navigate to HOME page by GOOGLE LOGIN',
        (tester) async {
      final mockObserver = MockNavigatorObserver();
      final googleMock = GoogleMock();
      when(() => googleMock()).thenAnswer(
          (invocation) async => Tuple.right(AppUser(displayName: "", id: "")));

      await tester.pumpWidget(MaterialApp(
        home: ChoiceSignPage(
          googleAuthUsecase: googleMock,
          userBloc: UserBloc(),
        ),
        routes: {
          AppRoutes.home: (context) => const Text("home"),
        },
        navigatorObservers: [mockObserver],
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(CommonButtonText));
      await tester.pumpAndSettle();
      expect(find.byType(GetStartedModalBottomSheet), findsOneWidget);

      await tester.tap(find.text("SIGN IN"));
      await tester.pumpAndSettle();
      expect(find.byType(SignInModalBottomSheet), findsOneWidget);

      await tester.tap(find.byKey(const ValueKey("GOOGLE")));
      await tester.pumpAndSettle(const Duration(seconds: 5));
      final exist = mockObserver.pushedRoutes
          .firstWhere((element) => element.settings.name == AppRoutes.home);

      expect(exist, isNotNull);
    });

    //TODO implementar teste de GITHUB
    // testWidgets('It should Navigate to HOME page by GITHUB LOGIN',
    //     (tester) async {
    //   final mockObserver = MockNavigatorObserver();
    //   final googleMock = GoogleMock();
    //   when(() => googleMock()).thenAnswer(
    //       (invocation) async => Tuple.right(AppUser(displayName: "", id: "")));

    //   await tester.pumpWidget(MaterialApp(
    //     home: ChoiceSignPage(
    //       googleAuthUsecase: googleMock,
    //       userBloc: UserBloc(),
    //     ),
    //     routes: {
    //       AppRoutes.home: (context) => const Text("home"),
    //     },
    //     navigatorObservers: [mockObserver],
    //   ));
    //   await tester.pumpAndSettle();

    //   await tester.tap(find.byType(CommonButtonText));
    //   await tester.pumpAndSettle();
    //   expect(find.byType(GetStartedModalBottomSheet), findsOneWidget);

    //   await tester.tap(find.text("SIGN IN"));
    //   await tester.pumpAndSettle();
    //   expect(find.byType(SignInModalBottomSheet), findsOneWidget);

    //   await tester.tap(find.byKey(const ValueKey("GOOGLE")));
    //   await tester.pumpAndSettle(const Duration(seconds: 5));
    //   final exist = mockObserver.pushedRoutes
    //       .firstWhere((element) => element.settings.name == AppRoutes.home);

    //   expect(exist, isNotNull);
    // });
  });
}
