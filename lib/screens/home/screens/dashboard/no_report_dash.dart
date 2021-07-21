import 'package:flutter/material.dart';
import 'package:flutter_emoji_suite/flutter_emoji_suite.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:provider/provider.dart';

class NoReportDash extends StatelessWidget {
  const NoReportDash({Key? key}) : super(key: key);

  _buildName(String name) {
    final String nameFormatted = name.split(' ')[0];

    var parser = EmojiParser();
    final ola = parser.get('wave').code;

    return Text(
      'Hello ${nameFormatted} $ola',
      style: Constants.kHeadlineStyle.copyWith(fontSize: 25),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String name = context.select((UserModel user) => user.name!);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildName(name), Text('NO REPORT')],
      ),
    );
  }
}
