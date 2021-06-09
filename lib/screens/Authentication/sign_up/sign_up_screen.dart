import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

final GlobalKey<ScaffoldState> _scaffoldRegKey = GlobalKey<ScaffoldState>();

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldRegKey,
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: Constants.boldSubheadlineStyle,
        ),
      ),
      body: SignUpBody(scaffoldKey: _scaffoldRegKey),
    );
  }
}
