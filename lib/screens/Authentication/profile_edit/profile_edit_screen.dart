import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

final GlobalKey<ScaffoldState> _scaffoldProfileEdit = GlobalKey<ScaffoldState>();

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldProfileEdit,
      appBar: AppBar(
        title: Text(
          'Profile Edit',
          style: Constants.boldSubheadlineStyle,
        ),
      ),
      body: ProfileBody(scaffoldKey: _scaffoldProfileEdit),
    );
  }
}
