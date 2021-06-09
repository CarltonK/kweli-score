import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';

class GlobalMultiInfoActionButton extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final VoidCallback onTap;
  const GlobalMultiInfoActionButton({
    Key? key,
    required this.primaryText,
    required this.secondaryText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          primaryText,
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            secondaryText,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
            ),
          ),
        ),
      ],
    );
  }
}
