import 'package:expanses_app/modules/splash/presenters/pages/spalsh_page.dart';
import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

class App extends StatelessWidget with BaseApp {
  App({super.key}) {
    super.registerInjections();
    super.registerRoutes();
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {
        "/splash": (context, args) => const SplashPage(),
      };

  @override
  List<MicroApp> get microApps => [];

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
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
    );
  }
}
