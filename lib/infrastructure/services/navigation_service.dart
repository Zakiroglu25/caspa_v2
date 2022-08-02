import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState>? navigationKey;

  static NavigationService instance = NavigationService();

  NavigationService() {
    navigationKey = GlobalKey<NavigatorState>();
  }
}

class NavigationService2 {
  GlobalKey<NavigatorState>? navigationKey;

  static NavigationService2 instance = NavigationService2();

  NavigationService() {
    navigationKey = GlobalKey<NavigatorState>();
  }
}
