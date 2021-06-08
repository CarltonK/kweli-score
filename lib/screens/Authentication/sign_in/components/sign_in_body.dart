import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';

class SignInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: DeviceConfig.screenHeight! * 0.04),
                Text(
                  'Welcome Back',
                  style: Constants.kHeadlineStyle,
                ),
                SizedBox(height: DeviceConfig.screenHeight! * 0.005),
                Text(
                  'Sign in with your identification number and password',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: DeviceConfig.screenHeight! * 0.08),
                SignInForm(),
                SizedBox(height: DeviceConfig.screenHeight! * 0.08),
                GlobalMultiInfoActionButton(
                  primaryText: 'Don\'t have an account ?',
                  secondaryText: 'Sign Up',
                  onTap: () => Navigator.of(context).push(
                    SlideLeftTransition(
                      page: SignUpScreen(),
                      routeName: 'sign_up_screen',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
