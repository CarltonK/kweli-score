import 'package:flutter/material.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

class SignUp extends StatelessWidget {
  static Validator _validator = Validator.empty();

  @override
  Widget build(BuildContext context) {
    // Dimensions
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text('Kweli Score', style: Constants.boldHeadlineStyle),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: _validator.fnameValidator,
              decoration: InputDecoration(
                border: Constants.blackInputBorder,
                enabledBorder: Constants.blackInputBorder,
                focusedBorder: Constants.blackInputBorder,
                labelText: 'First Name',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: _validator.lnameValidator,
              decoration: InputDecoration(
                border: Constants.blackInputBorder,
                enabledBorder: Constants.blackInputBorder,
                focusedBorder: Constants.blackInputBorder,
                labelText: 'Last Name',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
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
            const SizedBox(height: 10),
            TextFormField(
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
            const SizedBox(height: 10),
            TextFormField(
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
            const SizedBox(height: 10),
            TextFormField(
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
          ],
        ),
      ),
    );
  }
}
