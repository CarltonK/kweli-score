import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';
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

  static dynamic result;

  static Validator _validator = Validator.empty();
  static Dialogs _dialogs = Dialogs.empty();

  /*
  ******EMAIL STUFF******
  */
  Widget _emailTF() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
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
      ),
    );
  }

  _onEmailSaved(String value) {
    email = value.trim();
  }

  /*
  ******PASSWORD STUFF******
  */
  Widget _passwordTF() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
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
      ),
    );
  }

  _onPasswordSaved(String value) {
    password = value.trim();
  }

  /*
  ******SOCIAL SIGN IN STUFF******
  */
  // Widget _socialSignInRow() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: [
  //       SocialSignInButton(path: 'assets/images/facebook.jpg'),
  //       SocialSignInButton(path: 'assets/images/google.png'),
  //       SocialSignInButton(path: 'assets/images/twitter.png'),
  //     ],
  //   );
  // }

  Future<bool> serverCall(UserModel user, BuildContext context) async {
    result = await Provider.of<AuthProvider>(
      context,
      listen: false,
    ).signInEmailPass(_userModel);
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
            _dialogs.dialogInfo(_scaffoldKey.currentContext, result);
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
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Text('Kweli Score', style: Constants.boldHeadlineStyle),
                const SizedBox(height: 40),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Column(
                    children: [
                      _emailTF(),
                      const SizedBox(height: 20),
                      _passwordTF(),
                      const SizedBox(height: 40),
                      ActionButton(
                        onPressed: () => _loginBtnPressed(context),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
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
                  child: Text(
                    'Sign Up here',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
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
