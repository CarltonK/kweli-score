import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPasswordForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  ForgotPasswordForm({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _forgotPasswordFormKey = GlobalKey<FormState>();
  final List<String> errors = [];

  UserModel? user;
  String? identificationValue;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  resetHandler(UserModel user) async {
    return await context.read<ApiProvider>().startPinReset(user);
  }

  navigateToOtp() {
    Navigator.of(context).push(
      SlideLeftTransition(
        page: PassResetOtpScreen(),
        routeName: 'pass_reset_otp_screen',
      ),
    );
  }

  saveIdentificationValueToDevice(String userAsString) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', userAsString);
  }

  forgotPasswordPressed() {
    final FormState _formState = _forgotPasswordFormKey.currentState!;
    if (_formState.validate()) {
      _formState.save();

      KeyboardUtil.hideKeyboard(context);

      user = UserModel(idNumber: identificationValue);

      resetHandler(user!).then((value) async {
        ServerResponse resp = serverResponseFromJson(value.body);
        if (value.statusCode == 200) {
          await successToast('${resp.detail}');

          String userString = jsonEncode(user!.toinitialPinResetJson());
          await saveIdentificationValueToDevice(userString);

          navigateToOtp();
        } else {
          Future.delayed(Duration(milliseconds: 100), () {
            dialogInfo(
              widget.scaffoldKey.currentContext!,
              '${resp.detail}',
              'Warning',
            );
          });
        }
      }).catchError((error) {
        Future.delayed(Duration(milliseconds: 200), () {
          dialogInfo(
            widget.scaffoldKey.currentContext!,
            '${error.toString()}',
            'Error',
          );
        });
      });
    }
  }

  TextFormField buildIdentificationField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => identificationValue = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Constants.kIdNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Constants.kIdNumberNullError);
          return '';
        }
        return null;
      },
      onFieldSubmitted: (value) {
        KeyboardUtil.hideKeyboard(context);
        forgotPasswordPressed();
      },
      decoration: InputDecoration(
        labelText: 'Identification Number',
        hintText: 'Enter your ID / Passport',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GlobalIcon(svgIcon: "assets/icons/userIcon.svg"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _forgotPasswordFormKey,
      child: Column(
        children: [
          buildIdentificationField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: DeviceConfig.screenHeight! * 0.01),
          GlobalActionButton(
            action: 'Continue',
            onPressed: forgotPasswordPressed,
          ),
          SizedBox(height: DeviceConfig.screenHeight! * 0.01),
        ],
      ),
    );
  }
}
