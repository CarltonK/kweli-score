import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

final GlobalKey<ScaffoldState> _scaffoldPinResetKey =
    GlobalKey<ScaffoldState>();

class PinResetScreen extends StatelessWidget {
  const PinResetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldPinResetKey,
      appBar: AppBar(
        title: Text(
          'PIN Reset',
          style: Constants.boldSubheadlineStyle,
        ),
      ),
      body: PinResetBody(scaffoldKey: _scaffoldPinResetKey),
    );
  }
}
