import 'package:flutter/material.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';
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

  static Validator _validator = Validator.empty();

  // static dynamic result

  /*
  ******ID STUFF******
  */
  Widget _idTF() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
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
      ),
    );
  }

  _onIdNumberSaved(String value) {
    idNumber = value.trim();
  }

  /*
  ******EMAIL STUFF******
  */
  Widget _emailTF() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
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
      ),
    );
  }

  _onEmailSaved(String value) {
    email = value.trim();
  }

  /*
  ******PHONE NUMBER STUFF******
  */
  Widget _phoneNumberTF() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
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
      ),
    );
  }

  _onPhoneNumberSaved(String value) {
    phoneNumber = value.trim();
  }

  /*
  ******PASSWORD STUFF******
  */
  Widget _passwordTF() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
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
      ),
    );
  }

  _onPasswordSaved(String value) {
    password = value.trim();
  }

  /*
  ******CONFIRM PASSWORD STUFF******
  */
  Widget _confirmPasswordTF() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
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
      ),
    );
  }

  _onConfirmPasswordSaved(String value) {
    password2 = value.trim();
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

      Provider.of<AuthProvider>(context, listen: false).createUser(_userModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Dimensions
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                const SizedBox(height: 20),
                Text('Kweli Score', style: Constants.boldHeadlineStyle),
                const SizedBox(height: 20),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Column(
                    children: [
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
                          minWidth: 310,
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
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
