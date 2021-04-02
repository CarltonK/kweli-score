import 'package:flutter/material.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  static UserModel _userModel;

  final _formKey = GlobalKey<FormState>();

  static String email;
  static String idNumber;
  static String phoneNumber;
  static String password;
  static String password2;

  AuthProvider _authProvider;

  // static dynamic result;

  // static dynamic userProvider;

  static Validator _validator = Validator.empty();

  _onIdNumberSaved(String value) {
    idNumber = value.trim();
  }

  Widget _idTF() {
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
      ),
    );
  }

  _onEmailSaved(String value) {
    email = value.trim();
  }

  Widget _emailTF() {
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
      ),
    );
  }

  _onPhoneNumberSaved(String value) {
    phoneNumber = value.trim();
  }

  Widget _phoneNumberTF() {
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
        labelText: 'Phone NUmber',
      ),
    );
  }

  _onPasswordSaved(String value) {
    password = value.trim();
  }

  Widget _passwordTF() {
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
          icon: Icon(Icons.remove_red_eye),
          onPressed: null,
        ),
      ),
    );
  }

  _onConfirmPasswordSaved(String value) {
    password2 = value.trim();
  }

  Widget _confirmPasswordTF() {
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
          icon: Icon(Icons.remove_red_eye),
          onPressed: null,
        ),
      ),
    );
  }

  // Future<bool> serverCall(UserModel user) async {
  //   result = await userProvider.createUserEmailPass(user);

  //   if (result == 'Your password is weak. Please choose another') {
  //     return false;
  //   } else if (result == "The email format entered is invalid") {
  //     return false;
  //   } else if (result == "An account with the same email exists") {
  //     return false;
  //   } else if (result == null) {
  //     result = "Please check your internet connection";
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  void _registerBtnPressed(BuildContext context) async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();

      _userModel = UserModel(
        email: email,
        password: password,
        idNumber: idNumber,
        phoneNumber: phoneNumber,
      );
      _authProvider.createUser(_userModel);
    }
  }

  // Widget _signupRow() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: [
  //       Container(
  //         height: 50,
  //         width: 50,
  //         decoration: BoxDecoration(
  //           shape: BoxShape.circle,
  //         ),
  //         child: Image(
  //             image: AssetImage('assets/images/facebook.jpg'),
  //             fit: BoxFit.contain),
  //       ),
  //       Container(
  //         height: 50,
  //         width: 50,
  //         decoration: BoxDecoration(
  //           shape: BoxShape.circle,
  //         ),
  //         child: Image(
  //           image: AssetImage('assets/images/google.png'),
  //           fit: BoxFit.contain,
  //         ),
  //       ),
  //       Container(
  //         height: 50,
  //         width: 50,
  //         decoration: BoxDecoration(
  //           shape: BoxShape.circle,
  //         ),
  //         child: Image(
  //           image: AssetImage(
  //             'assets/images/twitter.png',
  //           ),
  //           fit: BoxFit.contain,
  //         ),
  //       )
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // Dimensions
    Size size = MediaQuery.of(context).size;
    return Consumer<AuthProvider>(
      builder: (context, value, child) {
        _authProvider = value;
        return child;
      },
      child: Scaffold(
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
                  const SizedBox(height: 20),
                  Text('Kweli Score', style: Constants.boldHeadlineStyle),
                  const SizedBox(height: 20),
                  _idTF(),
                  const SizedBox(height: 10),
                  _emailTF(),
                  const SizedBox(height: 10),
                  _phoneNumberTF(),
                  const SizedBox(height: 10),
                  _passwordTF(),
                  const SizedBox(height: 10),
                  _confirmPasswordTF(),
                  const SizedBox(height: 20),
                  MaterialButton(
                      minWidth: size.width,
                      elevation: 5,
                      height: 55,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: Colors.lightBlueAccent,
                      child: Text(
                        'Sign Up',
                        style: Constants.whiteBoldSubheadlineStyle,
                      ),
                      onPressed: () => _registerBtnPressed(context)),
                  const SizedBox(height: 60),
                  Text(
                    'Or Sign Up with',
                    style: Constants.boldSubheadlineStyle,
                  ),
                  const SizedBox(height: 20),
                  //     _signupRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
