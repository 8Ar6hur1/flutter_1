import 'package:flutter/material.dart';
import 'package:flutter_1/presentation/routes/AppRoutes.dart';

void main() {
  runApp(const MaterialApp(
    onGenerateRoute: AppRoutes.generateRoute,
    initialRoute: AppRoutes.splashScreen,
  ));
}
