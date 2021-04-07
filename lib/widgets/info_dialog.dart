import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';



class InfoDialog extends StatelessWidget {
  final String message;

  const InfoDialog({Key key, this.message}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
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
}
