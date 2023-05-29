import 'package:flutter/material.dart';

class MockNavigatorObserver extends NavigatorObserver {
  List<Route<dynamic>> pushedRoutes = [];
  List<Route<dynamic>> poppedRoutes = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    pushedRoutes.add(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    poppedRoutes.add(route);
  }
}
