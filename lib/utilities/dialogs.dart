import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/constants.dart';

class Dialogs {
  // Methods

  Dialogs.empty();

  Future dialogInfo(BuildContext context, String message) {
    return showCupertinoModalPopup(
        context: context,
        builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: contentBox(context, message),
            ));
  }
}

contentBox(context, String message) {
  return Stack(
    children: [
      Container(
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.only(
          top: 10,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: Constants.blackBoldNormal,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      Positioned(
        left: 20,
        right: 20,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 25,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: FlutterLogo(
              size: 100,
            ),
          ),
        ),
      ),
    ],
  );
}
