import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:splash/modules/get_started/presenters/pages/get_started_page.dart';
import 'package:splash/modules/splash/domain/use_cases/first_time_app/first_time_app_usecase.dart';
import 'package:splash/modules/splash/domain/use_cases/first_time_app/first_time_app_usecase_imp.dart';
import 'package:splash/modules/splash/domain/use_cases/get_user/get_user_usecase_imp.dart';
import 'package:splash/modules/splash/presenters/pages/spalsh_page.dart';
import 'package:common/common.dart';

class EmailAuthMock extends Mock implements EmailAuthUsecase {}

class GoogleAuthMock extends Mock implements GoogleAuthUsecase {}

class LogoutMock extends Mock implements LogoutUsecase {}

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
    await tester.pumpWidget(MaterialApp(
      home: SplashPage(
        userBloc: UserBloc(),
        firstTimeAppUseCase: FirstTimeAppUsecaseImp(
          appRepository: AppRepositorySharedImp(),
        ),
        getUserUsecase: GetUserUsecaseImp(
          appRepository: AppRepositorySharedImp(),
        ),
      ),
      routes: {
        AppRoutes.getStarted: (context) => GetStartedPage(
              googleAuthUsecase: GoogleAuthMock(),
              userBloc: UserBloc(),
            )
      },
    ));

    expect(find.byType(SplashPage), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.byType(GetStartedPage), findsOneWidget);
  });
}
