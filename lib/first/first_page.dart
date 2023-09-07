import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:daejeon/color.dart';
import 'package:daejeon/fri/fri_page.dart';
import 'package:daejeon/love/love_page.dart';
import 'package:daejeon/sat/sat_page.dart';
import 'package:daejeon/sun/sun_page.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _bottomNavIndex = 0;
  final iconList = const [
    LineIcons.smilingFace,
    LineIcons.beamingFaceWithSmilingEyes,
    LineIcons.smilingFaceWithHeartEyes,
    LineIcons.kissingFaceWithSmilingEyes,
  ];

  final pages = const [
    FriPage(),
    SatPage(),
    SunPage(),
    LovePage(),
  ];

  Widget _buildFavIcon({required double size}) {
    return Icon(
      Icons.favorite_rounded,
      color: AppColor.mainColors[0],
      size: size,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {},
        child: Hero(
          tag: 'love',
          flightShuttleBuilder: (
            flightContext,
            animation,
            flightDirection,
            fromHeroContext,
            toHeroContext,
          ) {
            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return _buildFavIcon(
                    size: 100 * (1 - animation.value) + 50 * animation.value);
              },
            );
          },
          child: _buildFavIcon(size: 50),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        inactiveColor: Colors.grey,
        height: 70,
        iconSize: 40,
        icons: iconList,
        activeColor: AppColor.mainColors[0],
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          child: pages[_bottomNavIndex % pages.length],
        ),
      ),
    );
  }
}
