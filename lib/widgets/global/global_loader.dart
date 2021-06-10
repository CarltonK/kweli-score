import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kweliscore/utilities/utilities.dart';

class GlobalLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: SpinKitWave(
        color: Palette.ksmartPrimary,
        size: 200,
      ),
    );
  }
}
