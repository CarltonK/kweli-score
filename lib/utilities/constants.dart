import 'package:flutter/material.dart';

class Constants {
  // Constructor
  Constants.empty();

  /*
  TEXT STYLES
  */
  static const TextStyle boldHeadlineStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );

  static const TextStyle whiteBoldSubheadlineStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle blackBoldNormal = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle boldSubheadlineStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle kHeadlineStyle = TextStyle(
    fontSize: 30,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle kHeadlineWhiteStyle = TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle kHeadlineBlackStyle = TextStyle(
    fontSize: 20,
    color: Colors.black,
  );

  static const TextStyle kNegativeButtonStyle = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle kPositiveButtonStyle = TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  /*
  BORDERS
  */
  static const InputBorder blackInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  );

  // Sizing
  static const double padding = 20;
  static const double avatarRadius = 45;
}
