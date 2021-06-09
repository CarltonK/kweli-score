import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

final GlobalKey<ScaffoldState> _scaffoldFpassKey = GlobalKey<ScaffoldState>();

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldFpassKey,
      appBar: AppBar(
        title: Text(
          'Forgot Password',
          style: Constants.boldSubheadlineStyle,
        ),
      ),
      body: ForgotPasswordBody(scaffoldKey: _scaffoldFpassKey),
    );
  }
}
