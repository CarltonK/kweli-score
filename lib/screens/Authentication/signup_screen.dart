import 'package:flutter/material.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  static Validator _validator = Validator.empty();
  Widget _idTF() {
    return TextFormField(
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

  Widget _emailTF() {
    return TextFormField(
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

  Widget _phoneNumberTF() {
    return TextFormField(
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

  Widget _passwordTF() {
    return TextFormField(
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

  Widget _confirmPasswordTF() {
    return TextFormField(
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

  Widget _signupRow() {
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

  @override
  Widget build(BuildContext context) {
    // Dimensions
    Size size = MediaQuery.of(context).size;
    return Consumer<AuthProvider>(builder: (context, value, child) {
          return child;
        },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
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
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    )
                  },
                ),
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
    );
  }
}
