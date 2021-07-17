import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';

class GlobalInfoDialog extends StatelessWidget {
  final String message;
  GlobalInfoDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.sentiment_dissatisfied,
            size: getProportionateScreenHeight(150),
            color: Palette.ksmartPrimary,
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Constants.kHeadlineBlackStyle,
          ),
        ],
      ),
    );
  }
}
