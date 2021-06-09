import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _signInFormKey = GlobalKey<FormState>();

  String? identificationValue;
  String? passwordValue;
  bool canRemember = false;
  final List<String> errors = [];

  final _focusPassword = FocusNode();

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

  TextFormField buildIdentificationField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
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
          return "";
        }
        return null;
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(_focusPassword);
      },
      decoration: InputDecoration(
        labelText: 'Identification Number',
        hintText: 'Enter your ID / Passport',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GlobalIcon(svgIcon: "assets/icons/userIcon.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      focusNode: _focusPassword,
      onFieldSubmitted: (value) {
        KeyboardUtil.hideKeyboard(context);
        loginButtonPressed();
      },
      maxLength: 4,
      onSaved: (newValue) => passwordValue = newValue,
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
        labelText: 'Password',
        hintText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GlobalIcon(svgIcon: "assets/icons/lock.svg"),
      ),
    );
  }

  loginButtonPressed() {
    final FormState _formState = _signInFormKey.currentState!;
    if (_formState.validate()) {
      _formState.save();

      KeyboardUtil.hideKeyboard(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signInFormKey,
      child: Column(
        children: [
          buildIdentificationField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: canRemember,
                activeColor: Palette.ksmartPrimary,
                onChanged: (value) {
                  setState(() {
                    canRemember = value!;
                  });
                },
              ),
              Text('Remember me'),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  SlideLeftTransition(
                    page: ForgotPasswordScreen(),
                    routeName: 'forgot_password_screen',
                  ),
                ),
                child: Text(
                  'Forgot Password',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          GlobalActionButton(
            action: 'Continue',
            onPressed: loginButtonPressed,
          ),
          SizedBox(height: DeviceConfig.screenHeight! * 0.01),
        ],
      ),
    );
  }
}
