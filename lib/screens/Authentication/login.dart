import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              height: 60,
            ),
            Text(
              'Kweli Score',
              style: GoogleFonts.muli(
                  textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              )),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) {
                //Check if email exists
                if (value.isEmpty) {
                  return 'Please provide an email';
                }
                //Check if @ sign exists
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
                  prefixIcon: Icon(Icons.email)),
            ),
            SizedBox(
              height: 20,
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
                  prefixIcon: Icon(Icons.vpn_key),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye), onPressed: null)),
            ),
            SizedBox(
              height: 40,
            ),
            MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                elevation: 5,
                height: 55,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                color: Colors.lightBlueAccent,
                child: Text(
                  'Sign In',
                  style: GoogleFonts.muli(
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                onPressed: () => {}),
            SizedBox(
              height: 10,
            ),
            FlatButton(
                onPressed: () => {},
                child: Text(
                  'Forgot Password',
                  style: GoogleFonts.muli(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                )),
            SizedBox(
              height: 60,
            ),
            Text(
              'Or Sign In with',
              style: GoogleFonts.muli(
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  //                     child: Image(image: Image.asset('assets/facebook.jpg')),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
