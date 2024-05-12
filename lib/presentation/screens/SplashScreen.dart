import 'package:flutter/material.dart';
import 'package:flutter_1/presentation/routes/AppRoutes.dart';
import 'package:flutter_1/utils/AppColor.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.pushNamed(context, AppRoutes.firstScreen);
    });

    return const MaterialApp(
      home: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Center(
          child: Text(
            "Hi!\n"
            "this is a screensaver\n"
            "to show\n"
            "what a cool developer I am)))",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColor.textColor, fontSize: 35),
          ),
        ),
      ),
    );
  }
}
