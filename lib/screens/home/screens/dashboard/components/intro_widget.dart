import 'package:flutter/material.dart';
import 'package:flutter_emoji_suite/flutter_emoji_suite.dart';
import 'package:kweliscore/utilities/utilities.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    Key? key,
    required this.expiryDate,
    required this.name,
    required this.period,
    required this.records,
  }) : super(key: key);
  final String period, expiryDate, name;
  final int records;

  _buildName() {
    final String nameFormatted = name.split(' ')[0];

    var parser = EmojiParser();
    final ola = parser.get('wave').code;

    return Text(
      'Hello ${nameFormatted} $ola',
      style: Constants.kHeadlineStyle.copyWith(fontSize: 25),
    );
  }

  _buildAnalysisBackground() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'We have analysed ',
            style: Constants.blackBoldNormal.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
          ),
          TextSpan(
            text: '$records ',
            style: Constants.blackBoldNormal.copyWith(fontSize: 20),
          ),
          TextSpan(
            text: 'records for the period of ',
            style: Constants.blackBoldNormal.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
          ),
          TextSpan(
            text: '$period. ',
            style: Constants.blackBoldNormal.copyWith(fontSize: 20),
          ),
          TextSpan(
            text: 'This analysis is valid until ',
            style: Constants.blackBoldNormal.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
          ),
          TextSpan(
            text: '$expiryDate.',
            style: Constants.blackBoldNormal.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildName(),
        SizedBox(height: getProportionateScreenHeight(10)),
        _buildAnalysisBackground(),
        SizedBox(height: getProportionateScreenHeight(25)),
      ],
    );
  }
}
