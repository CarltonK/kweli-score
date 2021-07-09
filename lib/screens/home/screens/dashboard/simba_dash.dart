import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
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
          SizedBox(height: getProportionateScreenHeight(20)),
          Text('Credit Factors', style: TextStyle(fontSize: 25)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    elevation: 3,
                    margin: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(10),
                      horizontal: getProportionateScreenWidth(5),
                    ),
                    color: Palette.ksmartPrimary,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PERSONA TRANSACTIONS',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                          Divider(height: 1),
                          const SizedBox(
                            height: 20,
                          ),
                          AnimatedContainer(
                            duration: Constants.fluidDuration,
                            height: 12,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(2),
                          ),
                          Text(
                            'Outgoing',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(7),
                          ),
                          AnimatedContainer(
                            duration: Constants.fluidDuration,
                            height: 12,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.greenAccent,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(2),
                          ),
                          Text(
                            'Incoming',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            TabbedViewTransactions(title: 'Paybills'),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    elevation: 3,
                    margin: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(10),
                      horizontal: getProportionateScreenWidth(5),
                    ),
                    color: Palette.ksmartPrimary,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PAYBILL TRANSACTIONS',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                          Divider(height: 1),
                          const SizedBox(
                            height: 20,
                          ),
                          AnimatedContainer(
                            duration: Constants.fluidDuration,
                            height: 12,
                            width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(2),
                          ),
                          Text(
                            'Outgoing',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(7),
                          ),
                          AnimatedContainer(
                            duration: Constants.fluidDuration,
                            height: 12,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.greenAccent,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(2),
                          ),
                          Text(
                            'Incoming',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
