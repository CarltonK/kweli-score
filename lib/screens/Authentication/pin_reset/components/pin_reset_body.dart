import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

class PinResetBody extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  PinResetBody({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => KeyboardUtil.hideKeyboard(context),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: DeviceConfig.screenHeight! * 0.04), // 4%
                  Text(
                    'Change your PIN',
                    style: Constants.kHeadlineStyle,
                  ),
                  SizedBox(height: DeviceConfig.screenHeight! * 0.005),
                  Text(
                    'Enter your new PIN',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: DeviceConfig.screenHeight! * 0.08),
                  PinResetForm(scaffoldKey: scaffoldKey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
