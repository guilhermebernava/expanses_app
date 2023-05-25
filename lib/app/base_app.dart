import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/login.dart';
import 'package:micro_core/micro_core.dart';
import 'package:splash/splash.dart';

class App extends StatelessWidget with BaseApp {
  App({super.key}) {
    CommonInjector.injection();
    super.registerInjections();
    super.registerRoutes();
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
        LoginResolver(),
        SplashResolver(),
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
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.green,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          background: AppColors.darkBlue,
          seedColor: AppColors.primary,
        ),
        useMaterial3: true,
      ),
    );
  }
}
