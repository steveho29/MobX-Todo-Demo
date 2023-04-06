import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NavigatorKeyLocator {
  static void setUp() {
    final navigatorKey = GlobalKey<NavigatorState>();

    final getIt = GetIt.instance;
    getIt.registerSingleton(navigatorKey);
  }
}
