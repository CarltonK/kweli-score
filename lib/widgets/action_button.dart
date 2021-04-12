import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';

class ActionButton extends StatelessWidget {
  final Function onPressed;
  final String action;

  ActionButton({
    Key key,
    @required this.action,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 310,
      elevation: 5,
      height: 55,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.lightBlueAccent,
      child: Text(action, style: Constants.whiteBoldSubheadlineStyle),
      onPressed: onPressed,
    );
  }
}
