import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:provider/provider.dart';

// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class Login extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  Login({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  static UserModel _userModel;

  static String email;
  static String idNumber;
  static String phoneNumber;
  static String password;
  static String password2;

  bool _visiblePass = true;

  static dynamic result;
  static dynamic authProvider;

  static ValidationHelper _validator = ValidationHelper.empty();
  static Dialogs _dialogs = Dialogs.empty();

  final _focusPassword = FocusNode();

  Widget _introText() {
    return Text(
      'Welcome',
      style: Constants.boldHeadlineStyle,
    );
  }

  Widget _emailTF(BuildContext context) {
    return TextFormField(
      onSaved: _onEmailSaved,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: _validator.emailValidator,
      onFieldSubmitted: (String value) {
        FocusScope.of(context).requestFocus(_focusPassword);
      },
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Email address',
        prefixIcon: const Icon(Icons.email),
      ),
    );
  }

  _onEmailSaved(String value) {
    email = value.trim();
  }

  Widget _passwordTF(BuildContext context) {
    return TextFormField(
      obscureText: _visiblePass,
      onSaved: _onPasswordSaved,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: _validator.passwordValidator,
      focusNode: _focusPassword,
      // onFieldSubmitted: (String value) {
      //   FocusScope.of(context).unfocus();
      //   _loginBtnPressed(context);
      // },
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Password',
        prefixIcon: Icon(Icons.vpn_key),
        suffixIcon: GestureDetector(
          child: const Icon(Icons.remove_red_eye),
          onTap: () {
            setState(() {
              _visiblePass = !_visiblePass;
            });
          },
        ),
      ),
    );
  }

  _onPasswordSaved(String value) {
    password = value.trim();
  }

  Future<bool> serverCall(UserModel user, BuildContext context) async {
    result = await authProvider.signInEmailPass(_userModel);
    if (result.runtimeType == String) {
      return false;
    }
    return true;
  }

  Widget _loginButton(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 15,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).primaryColor,
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
    );
  }

  void popDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  // void _loginBtnPressed(BuildContext context) {
  //   final FormState form = _formKey.currentState;
  //   if (form.validate()) {
  //     form.save();

  //     _userModel = UserModel(
  //       emailAddress: email,
  //       password: password,
  //     );

  //     serverCall(_userModel, context).then((value) {
  //       if (!value) {
  //         print(result);
  //         Timer(Duration(milliseconds: 500), () {
  //           _dialogs.dialogInfo(
  //             widget.scaffoldKey.currentContext,
  //             'Error',
  //             result,
  //             () => popDialog(widget.scaffoldKey.currentContext),
  //           );
  //         });
  //       }
  //     });
  //   }
  // }

  Widget _forgotPasswordButton(BuildContext context) {
    return Positioned(
      bottom: 20,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            SlideRightTransition(
                page: ForgotPassword(), routeName: 'password-reset'),
          );
        },
        child: Text(
          'Forgot Password ?',
          style: Constants.blackBoldNormal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Dimensions
    Size size = MediaQuery.of(context).size;
    return Consumer<AuthProvider>(
      builder: (context, AuthProvider value, child) {
        authProvider = value;
        return child;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    const SizedBox(height: 60),
                    _introText(),
                    const SizedBox(height: 50),
                    _emailTF(context),
                    const SizedBox(height: 20),
                    _passwordTF(context),
                  ],
                ),
              ),
            ),
            _forgotPasswordButton(context),
            _loginButton(context)
          ],
        ),
      ),
    );
  }
}
