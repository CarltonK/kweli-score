import 'package:flutter/material.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class ForgotPassword extends StatelessWidget {
  static ValidationHelper _validator = ValidationHelper.empty();
  static String? _identificationNumber;

  final _formKey = GlobalKey<FormState>();

  _onIdentificationNumberSaved(String? value) {
    _identificationNumber = value!.trim();
  }

  Widget _identificationNumberTF(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      validator: _validator.identityValidator,
      onSaved: _onIdentificationNumberSaved,
      onFieldSubmitted: (value) => _resetBtnPressed(context),
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Identification Number',
        prefixIcon: const Icon(Icons.perm_identity),
      ),
    );
  }

  Widget _resetBtn(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).primaryColor,
      ),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        onPressed: () {
          _resetBtnPressed(context);
        },
      ),
    );
  }

  resetHandler(BuildContext context, String idNumber) async {
    return await context.read<ApiProvider>().startPinReset(idNumber);
  }

  void _resetBtnPressed(BuildContext context) {
    final FormState form = _formKey.currentState!;
    if (form.validate()) {
      form.save();

      resetHandler(context, _identificationNumber!).then((value) {
        Future.delayed(Duration(milliseconds: 100), () {
          dialogInfo(_scaffoldKey.currentContext!, '${value.detail}', '');
        });
      }).catchError((error) {
        Future.delayed(Duration(milliseconds: 200), () {
          dialogInfo(
            _scaffoldKey.currentContext!,
            '${error.toString()}',
            'Error',
          );
        });
      });
    }
  }

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
              const SizedBox(height: 20),
              Text(
                "Enter the Identification Number associated with your account",
                style: Constants.boldSubheadlineStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _identificationNumberTF(context),
            ],
          ),
        ),
      ),
      floatingActionButton: _resetBtn(context),
    );
  }
}
