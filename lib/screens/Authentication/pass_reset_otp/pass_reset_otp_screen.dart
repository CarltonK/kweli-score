import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

final GlobalKey<ScaffoldState> _scaffoldPassResetOtpKey =
    GlobalKey<ScaffoldState>();

class PassResetOtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Scaffold(
      key: _scaffoldPassResetOtpKey,
      appBar: AppBar(
        title: Text(
          'OTP Verification',
          style: Constants.boldSubheadlineStyle,
        ),
      ),
      body: PassResetOtpBody(scaffoldKey: _scaffoldPassResetOtpKey),
    );
  }
}
