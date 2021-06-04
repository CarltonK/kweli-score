import 'package:flutter/material.dart';
// import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/constants.dart';

class IntroOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 150),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sema Eric, You are smart!!',
              style: Constants.blackBoldNormal,
            ),
            Image.asset('assets/images/data1.png'),
            SizedBox(
              height: 10,
            ),
            Text(
              'Please follow the steps on the next page to get your first Swara report',
              textAlign: TextAlign.center,
            ),
            Expanded(child: Container()),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => IntroTwo()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [Text("Let's Go  "), Icon(Icons.arrow_forward)],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class IntroTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blueAccent,
            )),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 70, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Instructions',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
                "1.  Change temporarily your mpesa statement email On your Safaricom mpesa line . Dial *234*5*1*3# and set your email to your_name@simbascore.com"),
            SizedBox(
              height: 15,
            ),
            Text(
                "2.  Once done with step 1 above you will receive a confirmation message from Safaricom on successful change before proceeding to step3 below."),
            SizedBox(
              height: 15,
            ),
            Text(
                "3.  Send us a 1 year mpesa statement by dialling: *234*5*1*1*3#   "),
            SizedBox(
              height: 15,
            ),
            Text(
                "4.  Enter the One Time Password sent to your phone in the next page"),
            Expanded(child: Container()),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: TextButton(
            //       onPressed: () {
            //         Navigator.push(context,
            //             MaterialPageRoute(builder: (context) => OTP()));
            //       },
            //       child: Row(
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           Text("Almost There  "),
            //           Icon(Icons.arrow_forward)
            //         ],
            //       )),
            // )
          ],
        ),
      ),
    );
  }
}
