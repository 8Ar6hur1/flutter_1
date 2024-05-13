import 'package:flutter/material.dart';
import 'package:flutter_1/presentation/routes/AppRoutes.dart';
import 'package:flutter_1/utils/AppColor.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, AppRoutes.firstScreen);
    });

    return const MaterialApp(
      home: Scaffold(
        backgroundColor: AppColor.mainBackgroundColor,
        body: Center(
          child: Text(
            "Зачекайте будь ласка",
            style: TextStyle(color: AppColor.textColor, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
