import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';

class TabWidget extends StatelessWidget {
  TabWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(title,
          style:
              Constants.blackBoldNormal.copyWith(fontWeight: FontWeight.w400)),
    );
  }
}
