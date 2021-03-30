import 'package:flutter/material.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/provider/auth_provider.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  static Validator _validator = Validator.empty();
  //email textField
  Widget _emailTF() {
    return TextFormField(
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
  Widget _passwordTF() {
    return TextFormField(
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

//Forgot Password Flat Button
  // Widget _forgetPasswordBTN() {
  //   return FlatButton(
  //     onPressed: () => {},
  //     child: Text(
  //       'Forgot Password?',
  //       style: Constants.blackBoldNormal,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // Dimensions
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
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
                onPressed: () => {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Package()),
                  // )
                  Provider.of<AuthProvider>(context, listen: false)
                      .anonymousSignIn()
                },
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
    );
  }
}
