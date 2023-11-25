import 'dart:convert';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_traning/colors.dart';
import 'package:ui_traning/home_page.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/video_info.json")
        .then((value) {
      videoInfo = json.decode(value);
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.blueJoma,
              AppColors.blueWhiteJoma.withOpacity(0.8),
            ],
            begin: FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => HomePage());
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: AppColors.whiteJoma,
                        ),
                      ),
                      Icon(
                        Icons.info_outline,
                        size: 20,
                        color: AppColors.whiteJoma,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Legs Toning \nand Glutes Workout",
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColors.whiteJoma.withOpacity(0.9),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.blueWhiteJoma.withOpacity(0.4),
                              AppColors.whiteJoma.withOpacity(0.2),
                            ],
                            begin: FractionalOffset(0.0, 0.4),
                            end: Alignment.topRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              color: AppColors.whiteJoma,
                              size: 20,
                            ),
                            Text(
                              "65 min",
                              style: TextStyle(
                                  fontSize: 14, color: AppColors.whiteJoma),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 220,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.blueWhiteJoma.withOpacity(0.4),
                              AppColors.whiteJoma.withOpacity(0.2),
                            ],
                            begin: FractionalOffset(0.0, 0.4),
                            end: Alignment.topRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.handyman,
                              color: AppColors.whiteJoma,
                              size: 20,
                            ),
                            Text(
                              "Resistent band, kettbell",
                              style: TextStyle(
                                  fontSize: 14, color: AppColors.whiteJoma),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteJoma,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "Circuit 1: Legs Toning",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackJoma.withOpacity(0.7)),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30,
                              color: AppColors.blueJoma,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "3 sets",
                              style: TextStyle(
                                  color: AppColors.blackJoma.withOpacity(0.5)),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                        itemCount: videoInfo.length,
                        itemBuilder: (_, int index) {
                          return GestureDetector(
                            onTap: () {
                              debugPrint(index.toString());
                            },
                            child: Container(
                              height: 135,
                              width: 200,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              videoInfo[index]["img"],
                                            ),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.play_circle,
                                          color: AppColors.whiteJoma
                                              .withOpacity(0.8),
                                          size: 30,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            videoInfo[index]["title"],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.blackJoma),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            videoInfo[index]["time"],
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.blackJoma
                                                    .withOpacity(0.7)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 17,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: AppColors.blueDarkJoma
                                                .withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Center(
                                          child: Text(
                                            "15 rest",
                                            style: TextStyle(
                                              color: AppColors.blueJoma,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 25),
                                        child: DottedLine(
                                          lineThickness: 2,
                                          dashColor: AppColors.blueJoma,
                                          lineLength: 250,
                                          dashLength: 2,
                                          dashGapRadius: 50,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
