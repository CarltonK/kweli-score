import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';

class InfoDialog extends StatelessWidget {
  final String message;

  const InfoDialog({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(40),
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                // Pass message, if null pass empty string
                message ?? '',
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
              borderRadius: BorderRadius.all(const Radius.circular(12)),
              child: const FlutterLogo(size: 100),
            ),
          ),
        ),
      ],
    );
  }
}
