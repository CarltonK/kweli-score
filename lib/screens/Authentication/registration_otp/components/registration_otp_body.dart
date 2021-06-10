import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

class OtpBody extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String? helperText;
  OtpBody({
    Key? key,
    required this.scaffoldKey,
    this.helperText = 'the phone number associated with the account',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => KeyboardUtil.hideKeyboard(context),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: DeviceConfig.screenHeight! * 0.05),
                  Text(
                    'OTP Verification',
                    style: Constants.kHeadlineStyle,
                  ),
                  Text('We sent your code to $helperText'),
                  // buildTimer(),
                  OtpForm(scaffoldKey: scaffoldKey),
                  // SizedBox(height: DeviceConfig.screenHeight! * 0.08),
                  // GestureDetector(
                  //   onTap: () {
                  //     // OTP code resend
                  //   },
                  //   child: Text(
                  //     'Resend OTP Code',
                  //     style: TextStyle(decoration: TextDecoration.underline),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('This code will expire in '),
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
