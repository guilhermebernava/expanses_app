import 'package:common/datasources/databases/app_database/shared_preferences/app_repository_shared_imp.dart';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash/modules/get_started/presenters/pages/get_started_page.dart';
import 'package:splash/modules/splash/domain/use_cases/first_time_app/first_time_app_usecase.dart';
import 'package:splash/modules/splash/domain/use_cases/first_time_app/first_time_app_usecase_imp.dart';
import 'package:splash/modules/splash/presenters/pages/spalsh_page.dart';
import 'package:splash/splash.dart';

class BaseMock extends StatelessWidget with BaseApp {
  BaseMock({super.key}) {
    super.registerRoutes();
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/splash",
      onGenerateRoute: super.generateRoute,
    );
  }

  @override
  List<MicroApp> get microApps => [
        SplashResolver(),
      ];
}

void main() {
  setUpAll(() {
    final getIt = GetIt.instance;
    Map<String, Object> values = <String, Object>{};
    SharedPreferences.setMockInitialValues(values);

    getIt.registerSingleton<FirstTimeAppUseCase>(
      FirstTimeAppUsecaseImp(
        appRepository: AppRepositorySharedImp(),
      ),
    );
  });

  testWidgets('It should create page and navigate to getStartedPage',
      (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(BaseMock());
    expect(find.byType(SplashPage), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.byType(GetStartedPage), findsOneWidget);
  });
}
