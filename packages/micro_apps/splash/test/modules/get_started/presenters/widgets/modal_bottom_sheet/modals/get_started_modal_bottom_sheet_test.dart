import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash/modules/get_started/presenters/widgets/modal_bottom_sheet/modals/get_started_modal_bottom_sheet.dart';
import 'package:splash/modules/get_started/services/show_modal_bottom_sheet_services.dart';

void main() {
  testWidgets('It should open and close modal bottom sheet', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(home: Scaffold()));
    await tester.pumpAndSettle();
    expect(find.byType(GetStartedModalBottomSheet), findsNothing);

    ShowModalBottomSheetServices.showGetStarted(
        tester.element(find.byType(Scaffold)), const Size(600, 600));
    await tester.pumpAndSettle();
    expect(find.byType(GetStartedModalBottomSheet), findsOneWidget);

    await tester.tapAt(const Offset(20.0, 20.0));
    await tester.pumpAndSettle();
    expect(find.byType(GetStartedModalBottomSheet), findsNothing);
  });

  testWidgets('It should find widgets', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(home: Scaffold()));
    await tester.pumpAndSettle();
    ShowModalBottomSheetServices.showGetStarted(
        tester.element(find.byType(Scaffold)), const Size(600, 600));
    await tester.pumpAndSettle();

    expect(find.text("Sign In"), findsOneWidget);
    expect(find.text("Sign Up"), findsOneWidget);

    final googleLogin = find.byWidgetPredicate((widget) {
      if (widget is SocialLoginButton && widget.image == AppAssets.googleIcon) {
        return true;
      }
      return false;
    });

    final githubLogin = find.byWidgetPredicate((widget) {
      if (widget is SocialLoginButton && widget.image == AppAssets.githubIcon) {
        return true;
      }
      return false;
    });

    expect(githubLogin, findsOneWidget);
    expect(googleLogin, findsOneWidget);
  });
}
