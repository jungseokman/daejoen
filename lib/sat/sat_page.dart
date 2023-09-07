import 'package:daejeon/color.dart';
import 'package:daejeon/widget/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;
import 'package:lottie/lottie.dart';

class SatPage extends StatefulWidget {
  const SatPage({super.key});

  @override
  State<SatPage> createState() => _SatPageState();
}

class _SatPageState extends State<SatPage> with TickerProviderStateMixin {
  late AnimationController _arrowController;

  final List<MenuData> menuDataList = [
    MenuData('assets/images/image8.jpeg', '푸드프라자 대전 신세계점', '점심식사',
        'https://map.naver.com/v5/entry/place/15938196?lng=127.291807663122&lat=36.269673785841306&placePath=%2Fhome&entry=plt&c=15,0,0,0,dh'),
    MenuData('assets/images/image9.jpeg', '신세계점 향수 시향', '1~2시간',
        'https://map.naver.com/v5/entry/place/1625213354?lng=127.382032&lat=36.3751116000003&placePath=%2Fhome&entry=plt&c=15,0,0,0,dh'),
    MenuData('assets/images/image10.jpeg', '한밭수목원', '약 1시간',
        'https://map.naver.com/v5/entry/place/11622659?lng=127.38798220000018&lat=36.3688238990989&placePath=%2Fphoto&entry=plt&c=15,0,0,0,dh'),
    MenuData('assets/images/image11.jpeg', '도군함박&도자카야', '저녁식사',
        'https://map.naver.com/v5/entry/place/38339142?lng=127.3786159858051&lat=36.350327154732575&placePath=%2Fhome&entry=plt&c=15,0,0,0,dh'),
    MenuData('assets/images/image12.jpeg', '캘리포니아 베이커리', '디저트 포장',
        'https://map.naver.com/v5/entry/place/34624733?lng=127.38750265680767&lat=36.349629763115765&placePath=%2Fphoto&entry=plt&c=15,0,0,0,dh'),
    MenuData('assets/images/image13.jpeg', '탑클라우드 호텔', '퇴실 12시',
        'https://www.goodchoice.kr/product/detail?ano=3373'),
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
      'SATURDAY',
      style: GoogleFonts.nanumPenScript(
        textStyle: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: AppColor.mainColors[1]),
      ),
    ));

    for (int i = 0; i < menuDataList.length; i++) {
      var data = menuDataList[i];

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

      // 마지막 요소가 아닌 경우에만 Lottie 위젯을 추가
      if (i != menuDataList.length - 1) {
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
