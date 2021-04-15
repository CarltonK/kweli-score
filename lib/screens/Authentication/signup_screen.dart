import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:provider/provider.dart';

// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class SignUp extends StatelessWidget {
  static UserModel _userModel;

  final _formKey = GlobalKey<FormState>();

  static String email;
  static String idNumber;
  static String phoneNumber;
  static String password;
  static String password2;
  static AuthProvider authProvider;

  static Validator _validator = Validator.empty();
  static Dialogs _dialogs = Dialogs.empty();

  static dynamic result;

  // Intro Text
  Widget _introText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Hello,', style: Constants.boldHeadlineStyle),
        const SizedBox(height: 10),
        Text('Enter your information below', style: Constants.blackBoldNormal)
      ],
    );
  }

  /*
  ******ID STUFF******
  */
  Widget _idTF(BuildContext context) {
    return TextFormField(
      onSaved: _onIdNumberSaved,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      validator: _validator.idValidator,
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'ID Number',
        prefixIcon: const Icon(Icons.perm_identity),
      ),
    );
  }

  _onIdNumberSaved(String value) {
    idNumber = value.trim();
  }

  /*
  ******EMAIL STUFF******
  */
  Widget _emailTF(BuildContext context) {
    return TextFormField(
      onSaved: _onEmailSaved,
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: _validator.emailValidator,
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Email',
        prefixIcon: const Icon(Icons.email),
      ),
    );
  }

  _onEmailSaved(String value) {
    email = value.trim();
  }

  /*
  ******PHONE NUMBER STUFF******
  */
  Widget _phoneNumberTF(BuildContext context) {
    return TextFormField(
      onSaved: _onPhoneNumberSaved,
      autofocus: false,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      validator: _validator.phoneValidator,
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Phone Number',
        prefixIcon: const Icon(Icons.phone),
      ),
    );
  }

  _onPhoneNumberSaved(String value) {
    phoneNumber = value.trim();
  }

  /*
  ******PASSWORD STUFF******
  */
  Widget _passwordTF(BuildContext context) {
    return TextFormField(
      onSaved: _onPasswordSaved,
      obscureText: true,
      autofocus: false,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: _validator.passwordValidator,
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: const Icon(Icons.remove_red_eye),
          onPressed: () => {},
        ),
      ),
    );
  }

  _onPasswordSaved(String value) {
    password = value.trim();
  }

  /*
  ******CONFIRM PASSWORD STUFF******
  */
  Widget _confirmPasswordTF(BuildContext context) {
    return TextFormField(
      onSaved: _onConfirmPasswordSaved,
      obscureText: true,
      autofocus: false,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: _validator.passwordValidator,
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Confirm Pasword',
        suffixIcon: IconButton(
          icon: const Icon(Icons.remove_red_eye),
          onPressed: () {},
        ),
      ),
    );
  }

  _onConfirmPasswordSaved(String value) {
    password2 = value.trim();
  }

  Future<bool> serverCall(UserModel user, BuildContext context) async {
    result = await authProvider.createUser(_userModel);
    if (result.runtimeType == String) {
      return false;
    }
    return true;
  }

  //Button Stuff
  Widget _registerButton(BuildContext context) {
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
          icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
          onPressed: () => _registerBtnPressed(context),
        ),
      ),
    );
  }

  void popDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _registerBtnPressed(BuildContext context) async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();

      _userModel = UserModel(
        emailAddress: email,
        password: password,
        nationalIdNumber: idNumber,
        phoneNumber: phoneNumber,
      );

      serverCall(_userModel, context).then((value) {
        if (!value) {
          Timer(Duration(milliseconds: 500), () {
            _dialogs.dialogInfo(
              context,
              'Error',
              result,
              () => popDialog(context),
            );
          });
        } else {
          Timer(Duration(milliseconds: 500), () {
            // _dialogs.dialogInfo(
            //   _scaffoldKey.currentContext,
            //   'Success',
            //   'Welcome to Kweli',
            //   () => popDialog(context),
            // );
          });
        }
      });
    }
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
          //  key: _scaffoldKey,
          children: <Widget>[
            Container(
              height: double.infinity,
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    const SizedBox(height: 60),
                    _introText(),
                    const SizedBox(height: 50),
                    _phoneNumberTF(context),
                    const SizedBox(height: 20),
                    _idTF(context),
                    const SizedBox(height: 20),
                    _emailTF(context),
                    const SizedBox(height: 20),
                    _passwordTF(context),
                    const SizedBox(height: 20),
                    _confirmPasswordTF(context),
                  ],
                ),
              ),
            ),
            _registerButton(context)
          ],
        ),
      ),
    );
  }
}
