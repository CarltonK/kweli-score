import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/auth_provider.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class Login extends StatelessWidget {
  static UserModel _userModel;

  final _formKey = GlobalKey<FormState>();

  static String email;
  static String idNumber;
  static String phoneNumber;
  static String password;
  static String password2;

  AuthProvider _authProvider;

  static Validator _validator = Validator.empty();
  //email textField
  _onEmailSaved(String value) {
    email = value.trim();
  }

  Widget _emailTF() {
    return TextFormField(
      onSaved: _onEmailSaved,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: _validator.emailValidator,
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Email',
        prefixIcon: Icon(Icons.email),
      ),
    );
  }

//password textField
  _onPasswordSaved(String value) {
    password = value.trim();
  }

  Widget _passwordTF() {
    return TextFormField(
      obscureText: true,
      onSaved: _onPasswordSaved,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: _validator.passwordValidator,
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Password',
        prefixIcon: Icon(Icons.vpn_key),
        suffixIcon: IconButton(
          icon: Icon(Icons.remove_red_eye),
          onPressed: null,
        ),
      ),
    );
  }

//Social Buttons Sign In
  Widget _socialSignInRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image(
              image: AssetImage('assets/images/facebook.jpg'),
              fit: BoxFit.contain),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image(
            image: AssetImage('assets/images/google.png'),
            fit: BoxFit.contain,
          ),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image(
            image: AssetImage(
              'assets/images/twitter.png',
            ),
            fit: BoxFit.contain,
          ),
        )
      ],
    );
  }

  dynamic result;

  Future dialogInfo(BuildContext context, String message) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  Future<bool> serverCall(UserModel user, BuildContext context) async {
    result = await Provider.of<AuthProvider>(
      context,
      listen: false,
    ).signInEmailPass(_userModel);
    print('RESULT=$result');
    if (result.runtimeType == String) {
      return false;
    }
    return true;
  }

  void _loginBtnPressed(BuildContext context) {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();

      _userModel = UserModel(
        email: email,
        password: password,
      );
      serverCall(_userModel, context).then((value) {
        if (!value) {
          Timer(Duration(seconds: 1), () {
            dialogInfo(_scaffoldKey.currentContext, result);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Dimensions
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Text('Kweli Score', style: Constants.boldHeadlineStyle),
                const SizedBox(height: 40),
                _emailTF(),
                const SizedBox(height: 20),
                _passwordTF(),
                const SizedBox(height: 40),
                MaterialButton(
                  minWidth: size.width,
                  elevation: 5,
                  height: 55,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Colors.lightBlueAccent,
                  child: Text(
                    'Sign In',
                    style: Constants.whiteBoldSubheadlineStyle,
                  ),
                  onPressed: () => _loginBtnPressed(context),
                ),
                const SizedBox(height: 10),
                FlatButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    )
                  },
                  child: Text(
                    'Forgot Password?',
                    style: Constants.blackBoldNormal,
                  ),
                ),
                const SizedBox(height: 60),
                Text(
                  "Don't have a account yet?",
                  style: Constants.boldSubheadlineStyle,
                ),
                FlatButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    )
                  },
                  child: Text('Sign Up here',
                      style: TextStyle(decoration: TextDecoration.underline)),
                ),
                // const SizedBox(height: 20),
                // _socialSignInRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
