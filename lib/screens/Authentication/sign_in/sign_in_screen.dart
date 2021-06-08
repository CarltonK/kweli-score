import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign In',
          style: Constants.boldSubheadlineStyle,
        ),
      ),
      body: SignInBody(),
    );
  }
}
