import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

final GlobalKey<ScaffoldState> _scaffoldLoginKey = GlobalKey<ScaffoldState>();

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldLoginKey,
      appBar: AppBar(
        title: Text(
          'Sign In',
          style: Constants.boldSubheadlineStyle,
        ),
      ),
      body: SignInBody(scaffoldKey: _scaffoldLoginKey),
    );
  }
}
