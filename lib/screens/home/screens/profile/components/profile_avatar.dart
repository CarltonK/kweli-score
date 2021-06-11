import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';

class ProfileAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Constants.kAvatarDecoration,
      child: CircleAvatar(
        radius: 35,
        backgroundImage: AssetImage(
          'assets/launcher/ksmart-transparent-logo.png',
        ),
      ),
    );
  }
}
