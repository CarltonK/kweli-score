import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kweliscore/helpers/validators.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class ForgotPassword extends StatelessWidget {
  static Validator _validator = Validator.empty();
  static Dialogs _dialogs = Dialogs.empty();
  static String _email;
  static dynamic result;

  final _formKey = GlobalKey<FormState>();

  _onEmailSaved(String value) {
    _email = value.trim();
  }

  Widget _resetPasswordTF() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.text,
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

  void _resetBtnPressed(BuildContext context) {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();

      serverCall(_email, context).then((value) {
        dynamic currentCtx = _scaffoldKey.currentContext;
        if (value) {
          Timer(Duration(seconds: 1), () {
            _dialogs.dialogInfo(
              currentCtx,
              'Success',
              'We have sent you an email',
              () => returnHome(context),
            );
          });
        } else {
          _dialogs.dialogInfo(
            currentCtx,
            'Error',
            result,
            () => popDialog(context),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Card(
                elevation: 5,
                color: Colors.white,
                child: Column(
                  children: [
                    Text('It happens', style: Constants.boldHeadlineStyle),
                    Text(
                      "We'll send you an email",
                      style: Constants.boldSubheadlineStyle,
                    ),
                    const SizedBox(height: 20),
                    _resetPasswordTF(),
                    const SizedBox(height: 30),
                    GlobalActionButton(
                      onPressed: () => _resetBtnPressed(context),
                      action: 'Send Email',
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
