import 'package:daejeon/color.dart';
import 'package:daejeon/widget/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;
import 'package:lottie/lottie.dart';

class SunPage extends StatefulWidget {
  const SunPage({super.key});

  @override
  State<SunPage> createState() => _SunPageState();
}

class _SunPageState extends State<SunPage> with TickerProviderStateMixin {
  late AnimationController _arrowController;

  final _textStyle = GoogleFonts.nanumPenScript(
    textStyle: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: AppColor.mainColors[1],
    ),
  );

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

  Widget _buildSpacer() => const SizedBox(height: 30);

  Widget _buildLottie(String url, double width) {
    return Lottie.network(
      url,
      controller: _arrowController,
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('SUNDAY', style: _textStyle),
          _buildSpacer(),
          MenuWidget(
            image: 'assets/images/image14.jpeg',
            title: '더 빠삭',
            text: '점심식사',
            ontap: () {
              html.window.open(
                  'https://map.naver.com/v5/entry/place/35150030?lng=127.31350662524882&lat=36.39156066963213&placePath=%2Fhome&entry=plt&c=15,0,0,0,dh',
                  '_blank');
            },
          ),
          _buildSpacer(),
          _buildLottie(
              'https://lottie.host/ec84a7b3-4ebb-4387-b8ac-56b63813fc39/A4HBN5K9FE.json',
              100),
          _buildSpacer(),
          MenuWidget(
            image: 'assets/images/image15.jpeg',
            title: '꾸드뱅',
            text: '약 1시간',
            ontap: () {
              html.window.open(
                  'https://map.naver.com/v5/entry/place/37865853?lng=127.30870210867859&lat=36.38667558981285&placePath=%2Fhome&entry=plt&c=15,0,0,0,dh',
                  '_blank');
            },
          ),
          _buildSpacer(),
          _buildLottie(
              'https://lottie.host/ec84a7b3-4ebb-4387-b8ac-56b63813fc39/A4HBN5K9FE.json',
              100),
          _buildLottie(
              'https://lottie.host/a5ed0621-b0fb-42be-bbbe-5d139c141c22/nixOPBYk42.json',
              400),
        ],
      ),
    );
  }
}
