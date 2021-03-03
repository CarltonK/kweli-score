import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kweliscore/screens/Authentication/login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Kweli Score',
              style: GoogleFonts.muli(
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) {
                //Check if fname exists
                if (value.isEmpty) {
                  return 'Please provide your First Name';
                }
                return null;
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                labelText: 'First Name',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) {
                //Check if lname exists
                if (value.isEmpty) {
                  return 'Please provide your Last Name';
                }
                return null;
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                labelText: 'Last Name',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (value) {
                //Check if email exists
                if (value.isEmpty) {
                  return 'Please provide an email';
                }
                //Check if @ exists
                if (!value.contains('@') || !value.contains('.')) {
                  return 'Please provide a valid email';
                }
                return null;
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                labelText: 'Email',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              validator: (value) {
                //Check if number exists
                if (value.isEmpty) {
                  return 'Please provide your Phone Number';
                }
                //Check if phone is not 10 digits
                if (value.length != 10) {
                  return 'Your phone number should be 10 digits';
                }
                //Check if phone starts with '07'
                if (!value.startsWith('07')) {
                  return 'Your phone number should start with 07';
                }
                return null;
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                labelText: 'Phone NUmber',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) {
                //Check if password exists
                if (value.isEmpty) {
                  return 'Please provide your Password';
                }
                //Check if password is less than 7 characters
                if (value.length < 7) {
                  return 'Your pasword is too short';
                }
                return null;
              },
              decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye), onPressed: null)),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) {
                //Check if password exists
                if (value.isEmpty) {
                  return 'Please confirm your Password';
                }
                //Check if passwords are same

                return null;
              },
              decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: 'Confirm Pasword',
                  suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye), onPressed: null)),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                elevation: 5,
                height: 55,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                color: Colors.lightBlueAccent,
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.muli(
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      )
                    }),
          ],
        ),
      ),
    );
  }
}
