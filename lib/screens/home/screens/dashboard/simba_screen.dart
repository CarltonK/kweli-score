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
            SizedBox(height: getProportionateScreenHeight(15)),
            Text(
              'Credit Factors',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    elevation: 5,
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
                            'TOTAL SPENT THIS MONTH',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            'KSH 38,068',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'DAILY AVERAGE',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            'KSH 1,312',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    elevation: 5,
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
                            'TOTAL SPENT THIS MONTH',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            'KSH 38,068',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'FAMILY AND FRIENDS',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            'KSH 22,593',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
