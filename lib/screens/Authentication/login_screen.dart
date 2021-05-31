import 'package:flutter/material.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  Login({Key? key, this.scaffoldKey}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  static String? idNumber;
  static String? password;

  bool _visiblePass = true;

  static ValidationHelper _validator = ValidationHelper.empty();

  final _focusPassword = FocusNode();

  Widget _introText() {
    return Text(
      'Welcome',
      style: Constants.boldHeadlineStyle,
    );
  }

  Widget _identificationNumberTF(BuildContext context) {
    return TextFormField(
      onSaved: _onIdentificationSaved,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: _validator.identityValidator,
      onFieldSubmitted: (String value) {
        FocusScope.of(context).requestFocus(_focusPassword);
      },
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Identification Number',
        prefixIcon: const Icon(Icons.perm_identity),
      ),
    );
  }

  _onIdentificationSaved(String? value) {
    idNumber = value!.trim();
  }

  Widget _pinTF(BuildContext context) {
    return TextFormField(
      obscureText: _visiblePass,
      onSaved: _onPasswordSaved,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      validator: _validator.pinValidator,
      focusNode: _focusPassword,
      onFieldSubmitted: (String value) {
        FocusScope.of(context).unfocus();
        _loginBtnPressed(context);
      },
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'PIN',
        prefixIcon: Icon(Icons.vpn_key),
        suffixIcon: GestureDetector(
          child: const Icon(Icons.remove_red_eye),
          onTap: () {
            setState(() {
              _visiblePass = !_visiblePass;
            });
          },
        ),
      ),
    );
  }

  _onPasswordSaved(String? value) {
    password = value!.trim();
  }

  Widget _loginButton(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 15,
      child: Container(
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
            _loginBtnPressed(context);
          },
        ),
      ),
    );
  }

  void popDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  Future loginHandler(BuildContext context, String identity, String pin) async {
    return await context.read<ApiProvider>().loginRequest(identity, pin);
  }

  void _loginBtnPressed(BuildContext context) {
    final FormState form = _formKey.currentState!;
    if (form.validate()) {
      form.save();

      loginHandler(context, idNumber!, password!).then((value) {
        if (value.runtimeType == LoginResponse) {
          successToast('Welcome ${value.user.name}');
        } else {
          errorToast(value.detail);
        }
      }).catchError((error) {
        errorToast(error.toString());
      });
    }
  }

  Widget _forgotPasswordButton(BuildContext context) {
    return Positioned(
      bottom: 20,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            SlideRightTransition(
              page: ForgotPassword(),
              routeName: 'pin-reset',
            ),
          );
        },
        child: Text(
          'Forgot PIN ?',
          style: Constants.blackBoldNormal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Dimensions
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            height: size.height,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  const SizedBox(height: 60),
                  _introText(),
                  const SizedBox(height: 50),
                  _identificationNumberTF(context),
                  const SizedBox(height: 20),
                  _pinTF(context),
                ],
              ),
            ),
          ),
          _forgotPasswordButton(context),
          _loginButton(context)
        ],
      ),
    );
  }
}
