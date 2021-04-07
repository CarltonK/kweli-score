import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kweliscore/widgets/widgets.dart';

class Dialogs {
  Dialogs.empty();

  Future dialogInfo(BuildContext context, String message) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: InfoDialog(message: message),
      ),
    );
  }
}
