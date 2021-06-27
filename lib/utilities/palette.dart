import 'package:flutter/material.dart';

class Palette {
  static const Color backgroundWhite = Color(0XFFFFFFFF);

  static const Color backgroundGrey = Color(0XFFF5F6F9);

  static const Color ksmartPrimary = Colors.orange;
  static const Color ksmartSecondary = Color.fromRGBO(41, 46, 64, 1);

  static const kTextColor = Color(0xFF757575);

  static const LinearGradient linearBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [backgroundWhite, backgroundWhite],
  );
}
