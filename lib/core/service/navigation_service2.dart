import 'package:flutter/material.dart';

class NavigationService2 {
  final GlobalKey<NavigatorState> navigatorKey2 = GlobalKey<NavigatorState>();
  static navigate(BuildContext context, String methodName, Widget goTo) {
    if (methodName == 'push') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => goTo,
        ),
      );
    }
    if (methodName == 'pushRep') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => goTo,
        ),
      );
    }
  }
}
