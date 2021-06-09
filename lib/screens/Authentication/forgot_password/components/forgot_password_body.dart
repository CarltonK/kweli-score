import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

class ForgotPasswordBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => KeyboardUtil.hideKeyboard(context),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  SizedBox(height: DeviceConfig.screenHeight! * 0.04),
                  Text(
                    'Forgot Password',
                    style: Constants.kHeadlineStyle,
                  ),
                  SizedBox(height: DeviceConfig.screenHeight! * 0.005),
                  Text(
                    'Please enter your identification number and we will send \nyou a link to return to your account',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: DeviceConfig.screenHeight! * 0.08),
                  ForgotPasswordForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
