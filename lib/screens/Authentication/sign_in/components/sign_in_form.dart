import 'package:flutter/material.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  SignInForm({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _signInFormKey = GlobalKey<FormState>();

  ApiProvider? _apiProvider;
  UserModel? user;
  String? identificationValue;
  String? passwordValue;
  TextEditingController? _editingController;
  bool canRemember = false;
  final List<String> errors = [];

  final _focusPassword = FocusNode();

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  TextFormField buildIdentificationField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      controller: _editingController,
      onSaved: (newValue) => identificationValue = newValue!.trim(),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Constants.kIdNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Constants.kIdNumberNullError);
          return '';
        }
        return null;
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(_focusPassword);
      },
      decoration: InputDecoration(
        labelText: 'Identification Number',
        hintText: 'Enter your ID / Passport',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GlobalIcon(svgIcon: "assets/icons/userIcon.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      focusNode: _focusPassword,
      onFieldSubmitted: (value) {
        KeyboardUtil.hideKeyboard(context);
        loginButtonPressed();
      },
      maxLength: 4,
      onSaved: (newValue) => passwordValue = newValue!.trim(),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Constants.kPassNullError);
        } else if (value.length < 4) {
          removeError(error: Constants.kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Constants.kPassNullError);
          return '';
        } else if (value.length < 4) {
          addError(error: Constants.kShortPassError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GlobalIcon(svgIcon: "assets/icons/lock.svg"),
      ),
    );
  }

  Future loginHandler(UserModel userModel) async {
    return await context.read<ApiProvider>().loginRequest(userModel);
  }

  loginButtonPressed() {
    final FormState _formState = _signInFormKey.currentState!;
    if (_formState.validate()) {
      _formState.save();

      KeyboardUtil.hideKeyboard(context);

      user = UserModel(
        idNumber: identificationValue,
        password: passwordValue,
      );

      loginHandler(user!).then((value) async {
        if (value.runtimeType == LoginResponse) {
          _apiProvider!.token = value.token;
          if (canRemember) {
            await setIdentificationValue(identificationValue!);
          }
          await successToast('Welcome ${value.user.name}');
        } else {
          Future.delayed(Duration(milliseconds: 100), () {
            dialogInfo(widget.scaffoldKey.currentContext!, '${value.detail}');
          });
        }
      }).catchError((error) {
        Future.delayed(Duration(milliseconds: 100), () {
          dialogInfo(
            widget.scaffoldKey.currentContext!,
            '${error.toString()}',
            'Error',
          );
        });
      });
    }
  }

  Future setIdentificationValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('identificationValue', '$value');
  }

  Future retrieveSavedIdentificationValue() async {
    SharedPreferences stringPrefs = await SharedPreferences.getInstance();
    identificationValue = stringPrefs.getString('identificationValue');
    identificationValue != null
        ? _editingController!.text = identificationValue!
        : _editingController!.text = '';
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (!_seen) {
      // Proceed to OnBoarding Screen
      await Navigator.push(
        context,
        SlideLeftTransition(
          page: OnBoarding(),
          routeName: 'onboarding_screen',
        ),
      );
      await prefs.setBool('seen', true);
    } else {
      await prefs.setBool('seen', true);
    }
  }

  checkBoxChanged(value) async {
    setState(() {
      canRemember = value!;
    });
  }

  @override
  void initState() {
    super.initState();

    checkFirstSeen();
    retrieveSavedIdentificationValue();
    _editingController = TextEditingController();
  }

  @override
  void dispose() {
    _editingController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context, value, child) {
        _apiProvider = value;
        return child!;
      },
      child: Form(
        key: _signInFormKey,
        child: Column(
          children: [
            buildIdentificationField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            Row(
              children: [
                Checkbox(
                  value: canRemember,
                  activeColor: Palette.ksmartPrimary,
                  onChanged: checkBoxChanged,
                ),
                Text('Remember me'),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    SlideLeftTransition(
                      page: ForgotPasswordScreen(),
                      routeName: 'forgot_password_screen',
                    ),
                  ),
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(20)),
            GlobalActionButton(
              action: 'Continue',
              onPressed: loginButtonPressed,
            ),
            SizedBox(height: DeviceConfig.screenHeight! * 0.01),
          ],
        ),
      ),
    );
  }
}
