import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash/modules/get_started/presenters/widgets/modal_bottom_sheet/social_login_button.dart';

void main() {
  testWidgets('It should create widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(
      MaterialApp(
        home: SocialLoginButton(
          image: AppAssets.githubIcon,
          size: const Size(100, 100),
          onTap: () {},
          color: AppColors.black,
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.byType(SocialLoginButton), findsOneWidget);
  });

  testWidgets('It should click must work', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    bool isClicked = false;
    await tester.pumpWidget(
      MaterialApp(
        home: SocialLoginButton(
          image: AppAssets.githubIcon,
          size: const Size(100, 100),
          onTap: () {
            isClicked = true;
          },
          color: AppColors.black,
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(isClicked, false);

    await tester.tap(find.byType(SocialLoginButton));
    await tester.pumpAndSettle();
    expect(isClicked, true);
  });
}
