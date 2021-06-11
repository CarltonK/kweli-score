import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';

Future dialogExitApp(BuildContext context, Function yesClick) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) => LogOutDialog(yesClick: yesClick),
  );
}

Future dialogInfo(BuildContext context, String message, [String? status]) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) => AlertDialog(
      content: InfoDialog(
        buttonPressed: () => Navigator.of(context).pop(),
        detail: message,
        status: status != null ? status : 'Warning',
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}

Future dialogSuccess(BuildContext context, String message) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) => AlertDialog(
      content: GlobalSuccessDialog(message: message),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}

Future dialogComingSoon(BuildContext context) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(
        'COMING SOON',
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'GOT IT',
            style: Constants.kPositiveButtonStyle,
          ),
        )
      ],
    ),
  );
}
