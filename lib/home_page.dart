import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_traning/colors.dart';
import 'package:ui_traning/video_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      info = json.decode(value);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteJoma,
      body: Container(
        padding: EdgeInsets.only(
          top: 50,
          left: 30,
          right: 30,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Traning",
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.greyJoma,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: AppColors.greyJoma,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: AppColors.greyJoma,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColors.greyJoma,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Your program",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.greyJoma.withOpacity(0.7),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.blueJoma,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => VideoInfo());
                  },
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    size: 20,
                    color: AppColors.greyJoma,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColors.blueJoma,
                  AppColors.blueWhiteJoma,
                ], begin: Alignment.bottomLeft, end: Alignment.center),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(80),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(10, 10),
                    blurRadius: 20,
                    color: AppColors.blueWhiteJoma.withOpacity(0.4),
                  ),
                ],
              ),
              child: Container(
                padding:
                    EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next workout",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.whiteJoma,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Legs Toning \nand Glutes Workout",
                      style: TextStyle(
                        fontSize: 25,
                        color: AppColors.whiteJoma.withOpacity(0.9),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          size: 20,
                          color: AppColors.whiteJoma,
                        ),
                        Text(
                          "60 min",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.whiteJoma,
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(10, 10),
                                blurRadius: 20,
                                color: AppColors.blueDarkJoma,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.play_circle_fill_rounded,
                            size: 40,
                            color: AppColors.whiteJoma,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 130,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          "img/backBW.jpg",
                        ),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40,
                          offset: Offset(8, 10),
                          color: AppColors.blueDarkJoma.withOpacity(0.2),
                        ),
                        BoxShadow(
                          blurRadius: 40,
                          offset: Offset(-2, -5),
                          color: AppColors.blueDarkJoma.withOpacity(0.2),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(right: 180, bottom: 5, left: 20),
                    decoration: BoxDecoration(
                      // color: Colors.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          "img/runGirl.png",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: EdgeInsets.only(
                        left: 150, top: 30, bottom: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You are doing great!',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blueJoma),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Keep it up\nstick to your plan',
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.blackJoma.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Area of focus",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: AppColors.blackJoma,
                  ),
                )
              ],
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: (info.length.toDouble() / 2).toInt(),
                    itemBuilder: (_, i) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width / 2.5,
                            padding: EdgeInsets.only(bottom: 5),
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: AppColors.whiteJoma,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: AppColors.blackJoma.withOpacity(0.2),
                                width: 1,
                              ),
                              image: DecorationImage(
                                image: AssetImage(info[i]['img']),
                              ),
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[i]['title'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.blackJoma.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width / 2.5,
                            padding: EdgeInsets.only(bottom: 5),
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: AppColors.whiteJoma,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: AppColors.blackJoma.withOpacity(0.2),
                                width: 1,
                              ),
                              image: DecorationImage(
                                image: AssetImage(info[i]['img']),
                              ),
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[i]['title'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.blackJoma.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
