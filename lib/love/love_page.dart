import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LovePage extends StatelessWidget {
  const LovePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 1),
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              '''자기야, 우리 첫 여행이야!
30년을 넘게 산 대전이지만,
자기랑 갈 생각하니깐 너무너무 설레♥︎
우리 이쁜 추억 쌓자!

다해는 진짜 착하고 이쁘고 사랑스러워,
내가 많이 좋아하는 거 알아줬으면 해ㅎㅎ
우리 오래오래 사랑하자!

언젠가 나랑 싸울 일도 생길 수도 있고,
나한테 서운한 점이 생길 수도 있고,
권태기가 생길 수도 있지만,
잘 이겨내자!!

매일, 나는 어제보다 오늘 너를 
더 사랑한다는 것을 깨닫게 돼
사랑해♥︎''',
              textStyle: GoogleFonts.nanumPenScript(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
              curve: Curves.linear,
              speed: const Duration(milliseconds: 200),
            ),
          ],
          totalRepeatCount: 1,
          displayFullTextOnTap: false,
          stopPauseOnTap: false,
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
