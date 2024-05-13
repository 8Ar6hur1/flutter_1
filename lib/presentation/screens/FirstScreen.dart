import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_1/presentation/routes/AppRoutes.dart';
import 'package:flutter_1/utils/AppColor.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _controller = TextEditingController();

  bool _fieldNotEmpty = false;

  bool _isLoading = false;

  void _startLoading() {
    setState(() {
      _isLoading = true;
    });

    Timer(const Duration(seconds: 1), () {
      Navigator.pushNamed(context, AppRoutes.secondScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: AppColor.mainBackgroundColor,
          body: Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(top: 132)),
                const Text(
                  "Як до вас звертатися?",
                  style: TextStyle(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                const Text(
                  "Будь ласка, укажіть ваше ім'я для\n"
                  "персоналізації сервісу.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: AppColor.textColor),
                ),
                const Padding(padding: EdgeInsets.only(top: 28)),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: TextField(
                    controller: _controller,
                    onChanged: (value) {
                      setState(() {
                        _fieldNotEmpty = value.isNotEmpty;
                      });
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Zа-яА-Я]'))
                    ],
                    decoration: InputDecoration(
                        labelText: "Ваше ім’я",
                        labelStyle: const TextStyle(color: AppColor.textColor),
                        filled: true,
                        fillColor: AppColor.backgroundColor,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17.0),
                            borderSide: const BorderSide(
                                color: AppColor.elementColor, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17.0),
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 0.0)),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15)),
                    style: const TextStyle(color: AppColor.textColor),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        width: 350,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            if (_fieldNotEmpty) {
                              _isLoading ? null : _startLoading();
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    Future.delayed(const Duration(seconds: 3),
                                        () {
                                      Navigator.of(context).pop(true);
                                    });
                                    return const AlertDialog(
                                      content: Text(
                                          'Введіть, будь ласка, своє ім\'я.'),
                                    );
                                  });
                            }
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: AppColor.elementColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17))),
                          child: _isLoading
                              ? const Center(
                                  child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          AppColor.textColor),
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: Text(
                                    "Продовжити",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: AppColor.textColor),
                                  ),
                                ),
                        )),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
              ],
            ),
          )),
    );
  }
}
