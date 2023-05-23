import 'package:common/common.dart';
import 'package:common/presenters/pages/error_page.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:micro_core/micro_core.dart';

class App extends StatelessWidget with BaseApp {
  App({super.key}) {
    CommonInjector.injection();
    super.registerInjections();
    super.registerRoutes();
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {
        ErrorPage.route: (context, args) => ErrorPage(error: args as String),
      };

  @override
  List<MicroApp> get microApps => [
        LoginResolver(),
      ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpansesApp',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      onGenerateRoute: super.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          background: AppColors.darkBlue,
          seedColor: AppColors.purple,
        ),
        useMaterial3: true,
      ),
    );
  }
}
