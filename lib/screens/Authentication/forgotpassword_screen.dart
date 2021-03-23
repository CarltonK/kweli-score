import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/constants.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/screens/screens.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => {Navigator.of(context).pop()}),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Card(
              elevation: 5,
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    'It happens',
                    style: Constants.boldHeadlineStyle,
                  ),
                  Text(
                    "We'll send you an email",
                    style: Constants.boldSubheadlineStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      //validator: _validator.emailValidator,
                      decoration: InputDecoration(
                        border: Constants.blackInputBorder,
                        enabledBorder: Constants.blackInputBorder,
                        focusedBorder: Constants.blackInputBorder,
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    minWidth: 300,
                    elevation: 5,
                    height: 55,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: Colors.lightBlueAccent,
                    child: Text(
                      'Send Email',
                      style: Constants.whiteBoldSubheadlineStyle,
                    ),
                    onPressed: () => {},
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
