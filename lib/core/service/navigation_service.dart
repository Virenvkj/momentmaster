import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future navigateTo({required String routeName, required Object arguments}) {
    if (navigatorKey.currentState != null) {
      return navigatorKey.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
    return Future.any([]);
  }

  bool pop({required String routeName, required Object argument}) {
    navigatorKey.currentState?.pop();
    return true;
  }
}
