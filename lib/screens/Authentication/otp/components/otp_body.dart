import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

class OtpBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: DeviceConfig.screenHeight! * 0.05),
              Text('OTP Verification'),
              Text('We sent your code to +1 898 860 ***'),
              buildTimer(),
              OtpForm(),
              SizedBox(height: DeviceConfig.screenHeight! * 0.1),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                },
                child: Text(
                  'Resend OTP Code',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('This code will expired in '),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, double value, child) => Text(
            '00:${value.toInt()}',
          ),
        ),
      ],
    );
  }
}
