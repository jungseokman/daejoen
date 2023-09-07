import 'package:flutter/material.dart';
import 'package:daejeon/color.dart';
import 'package:daejeon/textstyle.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
    this.ontap,
  }) : super(key: key);

  final String image;
  final String title;
  final String text;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildImage(),
        _sizedBox(10),
        _buildTitle(),
        _sizedBox(5),
        _buildSubtitle(),
        _sizedBox(20),
        _buildButton(),
      ],
    );
  }

  Widget _buildImage() {
    return Image.asset(
      image,
      fit: BoxFit.cover,
      width: double.maxFinite,
      height: 300,
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: AppTextStyles.h1.copyWith(fontSize: 18),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      'Time - $text',
      style: AppTextStyles.h2,
    );
  }

  Widget _buildButton() {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 130,
        height: 35,
        decoration: BoxDecoration(
          color: AppColor.mainColors[1],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            '자세히 보기',
            style: AppTextStyles.h1.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _sizedBox(double height) {
    return SizedBox(height: height);
  }
}
