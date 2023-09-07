import 'package:daejeon/color.dart';
import 'package:daejeon/first/first_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isAnimation = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        isAnimation = true;
      });
    });

    Future.delayed(const Duration(milliseconds: 4000), () {
      Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const FirstPage(),
        transitionsBuilder: (context, animation1, animation2, child) => child,
        transitionDuration: const Duration(seconds: 2),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
              return Container(
                width: double.maxFinite,
                color: Colors.white,
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 2000),
                  padding: EdgeInsets.only(bottom: isAnimation ? 100 : 200),
                  curve: Curves.fastOutSlowIn,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 2000),
                    curve: Curves.fastOutSlowIn,
                    opacity: isAnimation ? 1 : 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
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
                                return Icon(
                                  Icons.favorite_rounded,
                                  color: AppColor.mainColors[0],
                                  size: 100 * (1 - animation.value) +
                                      50 * animation.value,
                                );
                              },
                            );
                          },
                          child: Icon(
                            Icons.favorite_rounded,
                            color: AppColor.mainColors[0],
                            size: 100,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '다해와 석만이의 대전 여행',
                          style: GoogleFonts.nanumPenScript(
                            textStyle: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text('모바일 전용 웹입니다. 화면을 줄여주세요.'),
              );
            }
          },
        ),
      ),
    );
  }
}
