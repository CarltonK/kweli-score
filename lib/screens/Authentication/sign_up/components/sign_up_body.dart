import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

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
                SizedBox(height: DeviceConfig.screenHeight! * 0.04), // 4%
                Text('Register Account'),
                Text(
                  'Complete your details or continue \nwith social media',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: DeviceConfig.screenHeight! * 0.08),
                SignUpForm(),
                SizedBox(height: DeviceConfig.screenHeight! * 0.08),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'By continuing you confirm that you agree \n'
                  'with our Terms and Condition',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
