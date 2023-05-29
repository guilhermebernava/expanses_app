import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash/modules/get_started/presenters/widgets/lottie_box.dart';

void main() {
  testWidgets('It should create the widget', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MaterialApp(
        home: LottieBox(
            asset: AppAssets.investimentLottie, size: Size(100, 100))));
    await tester.pumpAndSettle();
    expect(find.byType(LottieBox), findsOneWidget);
  });
}
