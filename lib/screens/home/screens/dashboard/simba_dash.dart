import 'package:flutter/material.dart';
// import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';

class SimbaDash extends StatelessWidget {
  const SimbaDash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello Eric,',
            style: Constants.kHeadlineStyle.copyWith(fontSize: 25),
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          Text(
            'Your Credit Score went up by 20 points.',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          GlobalScoreWidget(scorePercentage: 0.8),
          SizedBox(height: getProportionateScreenHeight(10)),
          Text('Credit Factors', style: TextStyle(fontSize: 25)),
          SizedBox(height: getProportionateScreenHeight(10)),
          // CategoryBuilder(),
        ],
      ),
    );
  }
}
