import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinResetForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  PinResetForm({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  _PinResetFormState createState() => _PinResetFormState();
}

class _PinResetFormState extends State<PinResetForm> {
  final _pinResetFormKey = GlobalKey<FormState>();

  UserModel? user;

  String? otp;
  String? pinValue;
  String? confirmPinValue;

  final List<String> errors = [];

  final _focusPin = FocusNode();
  final _focusConfirmPin = FocusNode();

  TextEditingController? pinTextController;
  TextEditingController? confirmPinTextController;

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

  TextFormField buildPinFormField() {
    return TextFormField(
      obscureText: true,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      controller: pinTextController,
      focusNode: _focusPin,
      maxLength: 4,
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(_focusConfirmPin);
      },
      onSaved: (newValue) => pinValue = newValue!.trim(),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Constants.kPassNullError);
        } else if (value.length < 4) {
          removeError(error: Constants.kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Constants.kPassNullError);
          return '';
        } else if (value.length < 4) {
          addError(error: Constants.kShortPassError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'PIN',
        hintText: 'Enter your pin',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GlobalIcon(svgIcon: "assets/icons/lock.svg"),
      ),
    );
  }

  TextFormField buildConfirmPinFormField() {
    return TextFormField(
      obscureText: true,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      controller: confirmPinTextController,
      focusNode: _focusConfirmPin,
      onFieldSubmitted: (value) {
        KeyboardUtil.hideKeyboard(context);
        resetButtonPressed();
      },
      maxLength: 4,
      onSaved: (newValue) => confirmPinValue = newValue!.trim(),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Constants.kPassNullError);
        } else if (value.length < 4) {
          removeError(error: Constants.kShortPassError);
        } else if (value != pinTextController!.text) {
          removeError(error: Constants.kMatchPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Constants.kPassNullError);
          return '';
        } else if (value.length < 4) {
          addError(error: Constants.kShortPassError);
          return '';
        } else if (value != pinTextController!.text) {
          addError(error: Constants.kMatchPassError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Confirm PIN',
        hintText: 'Enter your pin again',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GlobalIcon(svgIcon: "assets/icons/lock.svg"),
      ),
    );
  }

  navigateToLogin() {
    // Remove this PinResetScreen, OtpScreen and SignUpScreen
    // Show Login Screen
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  resetHandler(UserModel model) async {
    return await context.read<ApiProvider>().finallyPinReset(model);
  }

  resetButtonPressed() async {
    final FormState _formState = _pinResetFormKey.currentState!;
    if (_formState.validate()) {
      _formState.save();

      KeyboardUtil.hideKeyboard(context);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userModelAsString = await prefs.getString('user');

      if (userModelAsString != null) {
        user = UserModel.fromJson(jsonDecode(userModelAsString));
        user!.pin = pinValue;
        user!.pinConfirm = confirmPinValue;

        // Connect the backend
        resetHandler(user!).then((value) async {
          ServerResponse resp = serverResponseFromJson(value.body);
          if (value.statusCode == 200) {
            _pinResetFormKey.currentState!.reset();
            await prefs.clear();

            await successToast('${resp.detail}');

            navigateToLogin();
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
          Future.delayed(Duration(milliseconds: 100), () {
            dialogInfo(
              widget.scaffoldKey.currentContext!,
              '${error.toString()}',
              'Error',
            );
          });
        });
      }
    }
  }

  @override
  void initState() {
    pinTextController = TextEditingController();
    confirmPinTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    pinTextController!.dispose();
    confirmPinTextController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _pinResetFormKey,
      child: Column(
        children: [
          buildPinFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfirmPinFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          GlobalActionButton(
            action: 'Continue',
            onPressed: resetButtonPressed,
          ),
          SizedBox(height: DeviceConfig.screenHeight! * 0.01),
        ],
      ),
    );
  }
}
