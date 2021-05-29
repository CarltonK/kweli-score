import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class ForgotPassword extends StatelessWidget {
  static ValidationHelper _validator = ValidationHelper.empty();
  static Dialogs _dialogs = Dialogs.empty();
  static String _email;
  static dynamic result;

  final _formKey = GlobalKey<FormState>();

  _onEmailSaved(String value) {
    _email = value.trim();
  }

  Widget _resetPasswordTF() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: _validator.emailValidator,
      onSaved: _onEmailSaved,
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Email',
        prefixIcon: const Icon(Icons.email),
      ),
    );
  }

  Widget _resetBtn(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blueAccent[200].withOpacity(0.7)),
      child: IconButton(
        icon: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }

  Future<bool> serverCall(String email, BuildContext context) async {
    result = await Provider.of<AuthProvider>(
      context,
      listen: false,
    ).resetPassword(email);
    if (result.runtimeType == String) {
      return false;
    }
    return true;
  }

  void returnHome(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  void popDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  // void _resetBtnPressed(BuildContext context) {
  //   final FormState form = _formKey.currentState;
  //   if (form.validate()) {
  //     form.save();

  //     serverCall(_email, context).then((value) {
  //       BuildContext currentCtx = _scaffoldKey.currentContext;
  //       if (value) {
  //         Timer(Duration(seconds: 1), () {
  //           _dialogs.dialogInfo(
  //             currentCtx,
  //             'Success',
  //             'We have sent you an email',
  //             () => returnHome(context),
  //           );
  //         });
  //       } else {
  //         _dialogs.dialogInfo(
  //           currentCtx,
  //           'Error',
  //           result.toString(),
  //           () => popDialog(context),
  //         );
  //       }
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // Dimensions
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.only(
          top: 0,
          left: 30,
          right: 30,
          bottom: 0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[200]),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Enter the email address associated with your account",
                style: Constants.boldSubheadlineStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _resetPasswordTF(),
            ],
          ),
        ),
      ),
      floatingActionButton: _resetBtn(context),
    );
  }
}
