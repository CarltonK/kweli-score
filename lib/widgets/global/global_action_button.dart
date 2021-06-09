import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';

class GlobalActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String action;

  GlobalActionButton({
    Key? key,
    required this.action,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: MaterialButton(
        shape: Constants.curvedRectBorder,
        color: Palette.ksmartPrimary,
        onPressed: onPressed,
        child: Text(
          action,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
