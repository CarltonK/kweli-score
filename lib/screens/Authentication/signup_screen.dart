import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  SignUp({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  List<String> _gender = ["Male", "Female", "I prefer not to disclose"];

  static String? _email;
  static String? _emailConfirm;
  static String? _idNumber;
  static String? _phoneNumber;
  static String? _password;
  static String? _passwordConfirm;
  static String? _name;
  String? _genderValue;
  static int _eighteenYearsInDays = 6570;
  static DateTime? _dob = DateTime.now().subtract(
    Duration(
      days: _eighteenYearsInDays,
    ),
  );

  static UserModel? _userModel;

  static TextEditingController? _passwordOne = TextEditingController();
  static TextEditingController? _passwordTwo = TextEditingController();

  static TextEditingController? _emailOne = TextEditingController();
  static TextEditingController? _emailTwo = TextEditingController();

  static ValidationHelper _validator = ValidationHelper.empty();

  DatePrettier? _datePrettier;

  bool _checkedTandC = false;
  bool _visiblePass = true;
  bool _visibleConfirmPass = true;

  Widget _introText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Hello,', style: Constants.boldHeadlineStyle),
        const SizedBox(height: 10),
        Text('Enter your information below', style: Constants.blackBoldNormal)
      ],
    );
  }

  Widget _fNameTF() {
    return TextFormField(
      onSaved: _onfNameSaved,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: _validator.fNameValidator,
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Full Name',
        prefixIcon: const Icon(Icons.perm_identity),
      ),
    );
  }

  _onfNameSaved(String? value) {
    _name = value!.trim();
  }

  Widget _idTF() {
    return TextFormField(
      onSaved: _onIdNumberSaved,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      validator: _validator.identityValidator,
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Identification Number',
        helperText: 'National ID / Passport',
        prefixIcon: const Icon(Icons.perm_identity),
      ),
    );
  }

  _onIdNumberSaved(String? value) {
    _idNumber = value!.trim();
  }

  Widget _emailTF() {
    return TextFormField(
      onSaved: _onEmailSaved,
      controller: _emailOne,
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: _validator.emailValidator,
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Email',
        prefixIcon: const Icon(Icons.email),
      ),
    );
  }

  _onEmailSaved(String? value) {
    _email = value!.trim();
  }

  Widget _confirmEmailTF() {
    return TextFormField(
      onSaved: _onConfirmEmailSaved,
      controller: _emailTwo,
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (_emailTwo!.text != _emailOne!.text) {
          return 'Emails don\'t match';
        }
        return null;
      },
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Confirm Email',
        prefixIcon: const Icon(Icons.email),
      ),
    );
  }

  _onConfirmEmailSaved(String? value) {
    _emailConfirm = value!.trim();
  }

  Widget _phoneNumberTF() {
    return TextFormField(
      onSaved: _onPhoneNumberSaved,
      autofocus: false,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      validator: _validator.phoneValidator,
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Phone Number',
        prefixIcon: const Icon(Icons.phone),
      ),
    );
  }

  _onPhoneNumberSaved(String? value) {
    _phoneNumber = value!.trim();
  }

  Widget _passwordTF() {
    return TextFormField(
      onSaved: _onPasswordSaved,
      obscureText: _visiblePass,
      controller: _passwordOne,
      autofocus: false,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: _validator.pinValidator,
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
    _password = value!.trim();
  }

  Widget _confirmPasswordTF() {
    return TextFormField(
      onSaved: _onConfirmPasswordSaved,
      obscureText: _visibleConfirmPass,
      autofocus: false,
      controller: _passwordTwo,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (_passwordTwo!.text != _passwordOne!.text) {
          return 'PIN doesn\'t match';
        }
        return null;
      },
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'Confirm PIN',
        prefixIcon: Icon(Icons.vpn_key),
        suffixIcon: GestureDetector(
          child: const Icon(Icons.remove_red_eye),
          onTap: () {
            setState(() {
              _visibleConfirmPass = !_visibleConfirmPass;
            });
          },
        ),
      ),
    );
  }

  _onConfirmPasswordSaved(String? value) {
    _passwordConfirm = value!.trim();
  }

  _genderSelector() {
    return Row(
      children: [
        Text(
          'Gender:',
          style: Constants.blackBoldNormal,
        ),
        const SizedBox(width: 30),
        DropdownButton(
          value: _genderValue,
          underline: Container(
            height: 1.5,
            decoration: Constants.kBoxDecoration,
          ),
          icon: Icon(Icons.arrow_downward),
          hint: Text('Select'),
          items: _gender
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: (String? value) {
            setState(() {
              _genderValue = value;
            });
          },
        ),
      ],
    );
  }

  Widget _registerButton() {
    return _checkedTandC
        ? Positioned(
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
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                onPressed: () => _registerBtnPressed(context),
              ),
            ),
          )
        : Container();
  }

  _termsConditionsWidget() {
    return CheckboxListTile(
      value: _checkedTandC,
      contentPadding: const EdgeInsets.only(left: 0),
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        "I have read and I agree to the terms and conditions",
      ),
      onChanged: (bool? value) {
        setState(() => _checkedTandC = value!);
      },
    );
  }

  // ******Date Selector Stuff*******
  Widget _dateSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date of Birth',
            style: Constants.blackBoldNormal,
          ),
          Container(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              maximumDate: DateTime.now().subtract(
                Duration(
                  days: _eighteenYearsInDays,
                ),
              ),
              initialDateTime: DateTime.now().subtract(
                Duration(
                  days: _eighteenYearsInDays + 1,
                ),
              ),
              onDateTimeChanged: (DateTime newDateTime) {
                setState(() {
                  _dob = newDateTime;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void popDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  _registrationHandler(UserModel model) async {
    return await context
        .read<ApiProvider>()
        .verifyDetailsBeforeRegistration(model);
  }

  _registerBtnPressed(BuildContext context) async {
    final FormState form = _formKey.currentState!;
    if (_genderValue == null) {
      Future.delayed(Duration(milliseconds: 100), () {
        dialogInfo(
          widget.scaffoldKey!.currentContext!,
          'Please select your gender',
          'Warning',
        );
      });
    } else {
      if (form.validate()) {
        form.save();

        _datePrettier = DatePrettier(_dob!);

        // Define the user
        _userModel = UserModel(
          name: _name,
          email: _email,
          email2: _emailConfirm,
          dob: _datePrettier!.convertToymd(),
          gender: _genderValue,
          idNumber: _idNumber,
          password1: _password,
          password2: _passwordConfirm,
          phone: _phoneNumber,
        );

        // Connect the backend
        _registrationHandler(_userModel!).then((value) {
          if (value.statusCode == 200) {
            Navigator.of(context).push(
              SlideLeftTransition(page: OTP(), routeName: 'verify_otp'),
            );
          } else {
            ServerResponse resp = serverResponseFromJson(value.body);
            Future.delayed(Duration(milliseconds: 100), () {
              dialogInfo(
                widget.scaffoldKey!.currentContext!,
                '${resp.detail}',
                'Warning',
              );
            });
          }
        }).catchError((error) {
          Future.delayed(Duration(milliseconds: 100), () {
            dialogInfo(
              widget.scaffoldKey!.currentContext!,
              '${error.toString()}',
              'Error',
            );
          });
        });
      }
    }
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
            height: double.infinity,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  const SizedBox(height: 40),
                  _introText(),
                  const SizedBox(height: 50),
                  _fNameTF(),
                  const SizedBox(height: 20),
                  _phoneNumberTF(),
                  const SizedBox(height: 20),
                  _idTF(),
                  const SizedBox(height: 20),
                  _emailTF(),
                  const SizedBox(height: 20),
                  _confirmEmailTF(),
                  const SizedBox(height: 20),
                  _passwordTF(),
                  const SizedBox(height: 20),
                  _confirmPasswordTF(),
                  const SizedBox(height: 20),
                  _genderSelector(),
                  const SizedBox(height: 20),
                  _dateSelector(),
                  const SizedBox(height: 20),
                  _termsConditionsWidget(),
                ],
              ),
            ),
          ),
          _registerButton()
        ],
      ),
    );
  }
}
