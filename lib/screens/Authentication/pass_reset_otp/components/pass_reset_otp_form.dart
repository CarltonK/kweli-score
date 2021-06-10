import 'dart:convert';
import 'package:kweliscore/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PassResetOtpForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  PassResetOtpForm({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  _PassResetOtpFormState createState() => _PassResetOtpFormState();
}

class _PassResetOtpFormState extends State<PassResetOtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  UserModel? _userModel;

  String otpValue = '';

  String formCompleteOtp(value) {
    if (value.length == 1) {
      otpValue += value;
    }
    return otpValue;
  }

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  verifyHandler(UserModel userModel) async {
    return await context.read<ApiProvider>().otpRegistration(userModel);
  }

  navigateToPinReset() {
    Navigator.of(context).push(SlideLeftTransition(
      page: PinResetScreen(),
      routeName: 'pin_reset_screen',
    ));
  }

  otpVerifyButtonPressed() async {
    KeyboardUtil.hideKeyboard(context);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userModelAsString = await prefs.getString('user');

    if (userModelAsString != null) {
      _userModel = UserModel.fromJson(jsonDecode(userModelAsString));
      _userModel!.otp = otpValue;

      String userString = jsonEncode(_userModel!.tointermidiatePinResetJson());
      await prefs.setString('user', userString);

      navigateToPinReset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: DeviceConfig.screenHeight! * 0.08),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: getProportionateScreenWidth(60),
              child: TextFormField(
                autofocus: true,
                obscureText: true,
                style: TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: Constants.otpInputDecoration,
                onChanged: (value) {
                  nextField(value, pin2FocusNode!);
                  formCompleteOtp(value);
                },
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(60),
              child: TextFormField(
                focusNode: pin2FocusNode,
                obscureText: true,
                style: TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: Constants.otpInputDecoration,
                onChanged: (value) {
                  nextField(value, pin3FocusNode!);
                  formCompleteOtp(value);
                },
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(60),
              child: TextFormField(
                focusNode: pin3FocusNode,
                obscureText: true,
                style: TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: Constants.otpInputDecoration,
                onChanged: (value) {
                  nextField(value, pin4FocusNode!);
                  formCompleteOtp(value);
                },
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(60),
              child: TextFormField(
                focusNode: pin4FocusNode,
                obscureText: true,
                style: TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: Constants.otpInputDecoration,
                onChanged: (value) {
                  nextField(value, pin5FocusNode!);
                  formCompleteOtp(value);
                },
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(60),
              child: TextFormField(
                focusNode: pin5FocusNode,
                obscureText: true,
                style: TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: Constants.otpInputDecoration,
                onChanged: (value) {
                  if (value.length == 1) {
                    pin5FocusNode!.unfocus();
                    formCompleteOtp(value);
                    otpVerifyButtonPressed();
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
