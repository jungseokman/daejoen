import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final _font = GoogleFonts.notoSans();

  static TextStyle get h1 =>
      _font.copyWith(fontSize: 14, fontWeight: FontWeight.bold);

  static TextStyle get h2 => _font.copyWith(
      fontSize: 15, color: Colors.grey, fontWeight: FontWeight.normal);
}
