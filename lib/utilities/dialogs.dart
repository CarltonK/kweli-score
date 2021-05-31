import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';

class Dialogs {
  Dialogs.empty();

  Future dialogInfo(
    BuildContext context, [
    String? status,
    String? detail,
    Function? onPressed,
    String? buttonText,
  ]) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: InfoDialog(
          detail: detail!,
          status: status!,
          buttonText: buttonText!,
          buttonPressed: onPressed!,
        ),
      ),
    );
  }
}
