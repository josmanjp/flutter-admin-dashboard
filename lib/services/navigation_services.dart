import 'package:flutter/material.dart';

class NavigationServices {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static navigateTo(String routeName) {
    navigatorKey.currentState!.pushNamed(routeName);
  }

  static replaceTo(String routeName) {
    navigatorKey.currentState!.pushReplacementNamed(routeName);
  }
}
