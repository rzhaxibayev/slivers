import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_traning/colors.dart';
import 'package:ui_traning/video_info.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  Widget em() {
    return CustomScrollView(
      physics: ClampingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          delegate: HeaderDelegate(),
          pinned: true,
        ),
        SliverToBoxAdapter(child: Text('Hello')),
        SliverList.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return const Text('data');
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteJoma,
      body: SafeArea(
        top: false,
        child: em(),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Text(
            "Traning",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 30,
              color: AppColors.greyJoma,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Row(
          children: [
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
        )
      ],
    );
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ColoredBox(
      color: Colors.yellow,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top,
        ),
        child: const Column(
          children: [Text('data')],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 200;

  @override
  // TODO: implement minExtent
  double get minExtent => 40 + 56;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
