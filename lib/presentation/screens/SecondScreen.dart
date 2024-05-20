import 'package:flutter/material.dart';
import 'package:flutter_1/domain/googlemap/MapSample.dart';
import 'package:flutter_1/utils/AppColor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SecondScreenState();
  }
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.elementColor,
          title: const Text(
            "logo",
            style: TextStyle(color: AppColor.textColor, fontSize: 18),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/telephone.svg',
                  width: 25,
                  height: 25,
                ))
          ],
        ),
        backgroundColor: AppColor.mainBackgroundColor,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 247,
                  decoration: const BoxDecoration(
                    color: AppColor.elementColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 237,
                        child: SvgPicture.asset('assets/groups/bg_car.svg'),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // const MapSample(),
                const Spacer(),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 40,
                          height: 50,
                          child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: AppColor.elementColor,
                              ),
                              child: const Text(
                                "Викликати майстра",
                                style: TextStyle(color: AppColor.textColor),
                              )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 104,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    'assets/buttons/active/active_orders.svg',
                                    width: 77,
                                    height: 58),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    'assets/buttons/active/active_home.svg',
                                    width: 77,
                                    height: 58),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    'assets/buttons/active/active_profile.svg',
                                    width: 77,
                                    height: 58),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
