import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_1/data/dataSources/LocationPermissionDataSource.dart';
import 'package:flutter_1/domain/usecases/InternetConnectCheckerDataSourceUseCase.dart';
import 'package:flutter_1/domain/usecases/LocationPermissionUseCase.dart';
import 'package:flutter_1/presentation/routes/AppRoutes.dart';
import 'package:flutter_1/utils/AppColor.dart';
import 'package:permission_handler/permission_handler.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _controller = TextEditingController();

  final _internetChecker =
      InternetConnectCheckerDataSourceUseCase(Connectivity());
  late final LocationPermissionUseCase _locationPermissionUseCase;

  bool _fieldNotEmpty = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _locationPermissionUseCase = LocationPermissionUseCase();
  }

  void _startLoading() async {
    setState(() {
      _isLoading = true;
    });

    bool isConnected = await _internetChecker.isInternetAvailable();
    if (isConnected) {
      Timer(const Duration(seconds: 1), () {
        Navigator.pushNamed(context, AppRoutes.secondScreen);
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text(
                'Відсутнє інтернет-з\'єднання. Перевірте ваше з\'єднання та спробуйте ще раз.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void requestLocationPermission() async {
    var status = await _locationPermissionUseCase.requestLocationPermission();

    if (status.isGranted) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text("Дозвіл на геолокацію надано."),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (status.isDenied) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text("Відмова у наданні дозволу на геолокацію."),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (status.isPermanentlyDenied) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text(
                "Постійна відмова у наданні дозволу на геолокацію. Будь ласка, змініть налаштування вручну."),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (status.isRestricted) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text("Доступ до геолокації обмежений."),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
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
                  width: MediaQuery.of(context).size.width - 40,
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
                        width: MediaQuery.of(context).size.width - 40,
                        height: 50,
                        child: TextButton(
                          onPressed: () async {
                            if (_fieldNotEmpty) {
                              bool isConnected =
                                  await _internetChecker.isInternetAvailable();
                              if (isConnected) {
                                requestLocationPermission();
                                _isLoading ? null : _startLoading();
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: const Text(
                                        'Відсутнє інтернет-з\'єднання. Перевірте ваше з\'єднання та спробуйте ще раз.',
                                        style: TextStyle(
                                            color: AppColor.textColor),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
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
