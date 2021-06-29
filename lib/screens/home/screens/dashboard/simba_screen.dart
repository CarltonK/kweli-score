import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';

class SimbaDash extends StatelessWidget {
  const SimbaDash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(20),
          horizontal: getProportionateScreenHeight(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello Eric,', style: Constants.kHeadlineStyle),
            SizedBox(height: getProportionateScreenHeight(10)),
            Text(
              'Your Credit Score went up by 20 points,',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
            ),
            SizedBox(height: getProportionateScreenHeight(5)),
            Text(
              'Good job',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            GlobalScoreWidget(scorePercentage: 0.8),
          ],
        ),
      ),
    );
  }
}
