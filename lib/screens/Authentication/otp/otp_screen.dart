import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

final GlobalKey<ScaffoldState> _scaffoldOtpKey = GlobalKey<ScaffoldState>();

class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'OTP Verification',
          style: Constants.boldSubheadlineStyle,
        ),
      ),
      body: OtpBody(scaffoldKey: _scaffoldOtpKey),
    );
  }
}
