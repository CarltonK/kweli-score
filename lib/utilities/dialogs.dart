import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogs {
  // Methods

  Dialogs.empty();

  Future dialogInfo(BuildContext context, String message) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
