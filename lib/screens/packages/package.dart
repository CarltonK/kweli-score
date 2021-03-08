import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

class Package extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Please select your payment plan,',
              style: Constants.boldSubheadlineStyle,
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FreePackage()),
                )
              },
              child: Container(
                  height: 170,
                  width: 340,
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Free'), Text('Ksh 0')],
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Container(
                  height: 170,
                  width: 340,
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Monthly'), Text('Ksh 28')],
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Container(
                  height: 170,
                  width: 340,
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Yearly'), Text('Ksh 250')],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
