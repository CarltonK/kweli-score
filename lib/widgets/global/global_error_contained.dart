import 'package:flutter/material.dart';
import 'package:kweliscore/widgets/widgets.dart';

class GlobalErrorContained extends StatelessWidget {
  final String errorMessage;

  GlobalErrorContained({Key key, @required this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: InfoDialog(
        buttonPressed: () {},
        status: 'Error',
        detail: errorMessage,
      ),
    );
  }
}
