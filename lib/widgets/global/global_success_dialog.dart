import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalSuccessDialog extends StatelessWidget {
  final String message;
  GlobalSuccessDialog({required this.message});

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
            Icons.sentiment_very_satisfied,
            size: 150,
            color: Colors.green,
          ),
          const SizedBox(height: 5),
          Text(message, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
