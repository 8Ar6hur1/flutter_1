import 'package:flutter/material.dart';
import 'package:flutter_1/presentation/screens/ErrorScreen.dart';
import 'package:flutter_1/presentation/screens/FirstScreen.dart';
import 'package:flutter_1/presentation/screens/SecondScreen.dart';
import 'package:flutter_1/presentation/screens/SplashScreen.dart';

class AppRoutes {
  static const String splashScreen = '/SplashScreen';
  static const String firstScreen = '/FirstScreen';
  static const String secondScreen = '/SecondScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case firstScreen:
        return MaterialPageRoute(builder: (_) => const FirstScreen());
      case secondScreen:
        return MaterialPageRoute(builder: (_) => const SecondScreen());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}
