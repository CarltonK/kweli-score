import 'dart:convert' show utf8;
import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';

// ignore: must_be_immutable
class BulletPoint extends StatelessWidget {
  final String? prefix;
  final List<String> bulletPoints;

  BulletPoint({
    Key? key,
    required this.bulletPoints,
    this.prefix,
  }) : super(key: key);

  final bullet = utf8.decode([0xE2, 0x80, 0xA2]);

  Widget showBulletPoints() {
    String text = prefix != null ? '$prefix\n\n' : '';
    bulletPoints.map((pt) => '$bullet $pt\n').forEach((element) {
      text += element;
    });
    return Text(
      text,
      style: Constants.kHeadlineBlackStyle.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
      textAlign: TextAlign.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return showBulletPoints();
  }
}
