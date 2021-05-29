import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:provider/provider.dart';

import '../screens.dart';

// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class SignUp extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  SignUp({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  List<String> _gender = ["male", "female", "I prefer not to disclose"];

  static String email;
  static String idNumber;
  static String phoneNumber;
  static String password;
  static String password2;
  static AuthProvider authProvider;
  static UserModel _userModel;

  static ValidationHelper _validator = ValidationHelper.empty();
  static Dialogs _dialogs = Dialogs.empty();

  static dynamic result;

  String selectedValue;

  bool _checked = false;
  bool _visiblePass = true;
  bool _visibleConfirmPass = true;

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

  Widget _fNameTF(BuildContext context) {
    return TextFormField(
      onSaved: _onfNameSaved,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: _validator.fNameValidator,
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Full  Name',
        prefixIcon: const Icon(Icons.perm_identity),
      ),
    );
  }

  _onfNameSaved(String value) {
    email = value.trim();
  }

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

  Widget _passwordTF(BuildContext context) {
    return TextFormField(
      onSaved: _onPasswordSaved,
      obscureText: _visiblePass,
      autofocus: false,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: _validator.passwordValidator,
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

  Widget _confirmPasswordTF(BuildContext context) {
    return TextFormField(
      onSaved: _onConfirmPasswordSaved,
      obscureText: _visibleConfirmPass,
      autofocus: false,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: _validator.passwordValidator,
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Confirm Pasword',
        prefixIcon: Icon(Icons.vpn_key),
        suffixIcon: GestureDetector(
          child: const Icon(Icons.remove_red_eye),
          onTap: () {
            setState(() {
              _visibleConfirmPass = !_visibleConfirmPass;
            });
          },
        ),
      ),
    );
  }

  _onConfirmPasswordSaved(String value) {
    password2 = value.trim();
  }

  // Future<bool> serverCall(UserModel user, BuildContext context) async {
  //   result = await authProvider.createUser(_userModel);
  //   if (result.runtimeType == String) {
  //     return false;
  //   }
  //   return true;
  // }

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
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          },
        ),
      ),
    );
  }

  void popDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  // void _registerBtnPressed(BuildContext context) async {
  //   final FormState form = _formKey.currentState;
  //   if (form.validate()) {
  //     form.save();

  //     _userModel = UserModel(
  //       emailAddress: email,
  //       password: password,
  //       nationalIdNumber: idNumber,
  //       phoneNumber: phoneNumber,
  //     );

  //     await serverCall(_userModel, context).then((value) {
  //       if (!value) {
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
              height: double.infinity,
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    const SizedBox(height: 40),
                    _introText(),
                    const SizedBox(height: 50),
                    _fNameTF(context),
                    const SizedBox(height: 20),
                    _phoneNumberTF(context),
                    const SizedBox(height: 20),
                    _idTF(context),
                    const SizedBox(height: 20),
                    _emailTF(context),
                    const SizedBox(height: 20),
                    _passwordTF(context),
                    const SizedBox(height: 20),
                    _confirmPasswordTF(context),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Gender:',
                          style: Constants.blackBoldNormal,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        DropdownButton(
                          value: selectedValue,
                          underline: Container(
                            height: 1.5,
                            color: Colors.greenAccent,
                          ),
                          items: _gender
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(
                                    e,
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CheckboxListTile(
                      value: _checked,
                      contentPadding: EdgeInsets.only(left: 0),
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                          "I have read and agree to the terms and conditions"),
                      onChanged: (bool value) {
                        setState(() => _checked = value);
                      },
                    )
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
