import 'package:daejeon/color.dart';
import 'package:daejeon/widget/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;
import 'package:lottie/lottie.dart';

class FriPage extends StatefulWidget {
  const FriPage({super.key});

  @override
  State<FriPage> createState() => _FriPageState();
}

class _FriPageState extends State<FriPage> with TickerProviderStateMixin {
  late AnimationController _arrowController;

  final List<MenuData> menuDataList = [
    MenuData('assets/images/image1.jpeg', '떡반집', '도착 직후',
        'https://map.naver.com/v5/entry/place/36458437?lng=127.37497237113791&lat=36.35222350692575&placePath=%2Fhome&entry=plt&c=14.71,0,0,0,dh'),
    MenuData('assets/images/image2.jpeg', '팡시온', '1~2시간',
        'https://map.naver.com/v5/search/%EB%8C%80%EC%A0%84%20%ED%8C%A1%EC%8B%9C%EC%98%A8/place/1116040272?placePath=%3Fentry%253Dpll&c=15,0,0,0,dh'),
    MenuData('assets/images/image3.jpeg', '금강로하스대청공원', '약 1시간',
        'https://map.naver.com/v5/entry/place/32017017?lng=127.4743432001021&lat=36.47299959876284&placePath=%2Fhome&entry=plt&c=15,0,0,0,dh'),
    MenuData('assets/images/image4.jpeg', '백제식당', '저녁식사',
        'https://map.naver.com/v5/entry/place/11893232?lng=127.458855415636&lat=36.290669278940896&placePath=%2Fhome&entry=plt&c=15,0,0,0,dh'),
    MenuData('assets/images/image5.jpeg', '식장산 전망대', '약 30분',
        'https://map.naver.com/v5/entry/place/11491454?lng=127.48111000000003&lat=36.299711500000015&placePath=%2Fhome&entry=plt&c=15,0,0,0,dh'),
    MenuData('assets/images/image6.jpeg', '호텔 더 리즈', '퇴실 12시',
        'https://www.goodchoice.kr/product/detail?ano=3077'),
  ];

  @override
  void initState() {
    super.initState();

    _arrowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _arrowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _buildPageContent(),
      ),
    );
  }

  List<Widget> _buildPageContent() {
    List<Widget> content = [];

    content.add(Text(
      'FRIDAY',
      style: GoogleFonts.nanumPenScript(
        textStyle: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: AppColor.mainColors[1]),
      ),
    ));

    for (var data in menuDataList) {
      content.add(const SizedBox(height: 30));
      content.add(MenuWidget(
        image: data.image,
        title: data.title,
        text: data.text,
        ontap: () {
          html.window.open(data.url, '_blank');
        },
      ));
      content.add(const SizedBox(height: 30));

      // 현재 data가 마지막 요소가 아닐 때만 Lottie 위젯을 추가
      if (menuDataList.indexOf(data) != menuDataList.length - 1) {
        content.add(Lottie.network(
          'https://lottie.host/ec84a7b3-4ebb-4387-b8ac-56b63813fc39/A4HBN5K9FE.json',
          controller: _arrowController,
          width: 100,
        ));
      }
    }

    content.add(const SizedBox(height: 10));

    return content;
  }
}

class MenuData {
  final String image;
  final String title;
  final String text;
  final String url;

  MenuData(this.image, this.title, this.text, this.url);
}
