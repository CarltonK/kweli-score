import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/constants.dart';
import 'package:kweliscore/widgets/info_dialog.dart';

class Dialogs {
  // Methods

  Dialogs.empty();

  Future dialogInfo(BuildContext context, String message) {
    return showCupertinoModalPopup(
        context: context,
        builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: contentBox(context, message),
            ));
  }
}

contentBox(context, String message) {
  return InfoDialog(
    message: message,
  );
}
