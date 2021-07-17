import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kweliscore/utilities/utilities.dart';

class AnalysisLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        color: Palette.ksmartPrimary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitPouringHourglass(
              color: Colors.white,
              size: 200,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Hi K-Smart User, You are smart!!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Text(
              'Please give us a moment as we analyse your statement',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
