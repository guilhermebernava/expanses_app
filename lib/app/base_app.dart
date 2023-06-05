import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home/home_resolver.dart';
import 'package:login/login.dart';
import 'package:micro_core/micro_core.dart';
import 'package:splash/splash.dart';

class App extends StatefulWidget with BaseApp {
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
        HomeResolver(),
      ];

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_AppState>()?.restartApp();
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: key,
      title: 'ExpansesApp',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: widget.generateRoute,
      theme: ThemeData(
        dialogTheme: DialogTheme(
          backgroundColor: AppColors.darkBlue,
          titleTextStyle: AppFonts.montserrat(
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primary,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          background: AppColors.darkBlue,
          brightness: Brightness.dark,
          seedColor: AppColors.primary,
        ),
        useMaterial3: true,
      ),
    );
  }
}
