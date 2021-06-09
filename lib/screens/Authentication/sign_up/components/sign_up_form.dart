import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';

class SignUpForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  SignUpForm({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _signUpFormKey = GlobalKey<FormState>();

  String? identificationValue;
  String? phoneNumber;
  String? emailAddress;
  String? fullName;
  String? pinValue;
  String? confirmPinValue;

  final List<String> errors = [];

  final _focusPin = FocusNode();
  final _focusConfirmPin = FocusNode();
  final _focusIdentificationValue = FocusNode();
  final _focusPhoneNumber = FocusNode();
  final _focusEmail = FocusNode();

  TextEditingController? pinTextController;
  TextEditingController? confirmPinTextController;

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

  TextFormField buildFullNameField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => fullName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Constants.kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Constants.kNamelNullError);
          return '';
        }
        return null;
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(_focusEmail);
      },
      decoration: InputDecoration(
        labelText: 'Full Name',
        hintText: 'Enter your full name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GlobalIcon(svgIcon: "assets/icons/userIcon.svg"),
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      focusNode: _focusEmail,
      onSaved: (newValue) => emailAddress = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Constants.kInvalidEmailError);
        } else if (Constants.emailValidatorRegExp.hasMatch(value)) {
          removeError(error: Constants.kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Constants.kInvalidEmailError);
          return '';
        } else if (!Constants.emailValidatorRegExp.hasMatch(value)) {
          addError(error: Constants.kInvalidEmailError);
          return '';
        }
        return null;
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(_focusIdentificationValue);
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GlobalIcon(svgIcon: "assets/icons/userIcon.svg"),
      ),
    );
  }

  TextFormField buildIdentificationField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _focusIdentificationValue,
      onSaved: (newValue) => identificationValue = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Constants.kIdNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Constants.kIdNumberNullError);
          return "";
        }
        return null;
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(_focusPhoneNumber);
      },
      decoration: InputDecoration(
        labelText: 'Identification Number',
        hintText: 'Enter your ID / Passport',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GlobalIcon(svgIcon: "assets/icons/userIcon.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      focusNode: _focusPhoneNumber,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Constants.kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Constants.kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(_focusPin);
      },
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintText: 'Enter your phone number',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GlobalIcon(svgIcon: "assets/icons/userIcon.svg"),
      ),
    );
  }

  TextFormField buildPinFormField() {
    return TextFormField(
      obscureText: true,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      controller: pinTextController,
      focusNode: _focusPin,
      maxLength: 4,
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(_focusConfirmPin);
      },
      onSaved: (newValue) => pinValue = newValue,
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
        labelText: 'PIN',
        hintText: 'Enter your pin',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GlobalIcon(svgIcon: "assets/icons/lock.svg"),
      ),
    );
  }

  TextFormField buildConfirmPinFormField() {
    return TextFormField(
      obscureText: true,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      controller: confirmPinTextController,
      focusNode: _focusConfirmPin,
      onFieldSubmitted: (value) {
        KeyboardUtil.hideKeyboard(context);
        registrationButtonPressed();
      },
      maxLength: 4,
      onSaved: (newValue) => confirmPinValue = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Constants.kPassNullError);
        } else if (value.length < 4) {
          removeError(error: Constants.kShortPassError);
        } else if (value != pinTextController!.text) {
          removeError(error: Constants.kMatchPassError);
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
        } else if (value != pinTextController!.text) {
          addError(error: Constants.kMatchPassError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Confirm PIN',
        hintText: 'Enter your pin again',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GlobalIcon(svgIcon: "assets/icons/lock.svg"),
      ),
    );
  }

  registrationButtonPressed() {
    final FormState _formState = _signUpFormKey.currentState!;
    if (_formState.validate()) {
      _formState.save();

      KeyboardUtil.hideKeyboard(context);
    }
  }

  @override
  void initState() {
    pinTextController = TextEditingController();
    confirmPinTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    pinTextController!.dispose();
    confirmPinTextController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signUpFormKey,
      child: Column(
        children: [
          buildFullNameField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildIdentificationField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPinFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfirmPinFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          GlobalActionButton(
            action: 'Continue',
            onPressed: registrationButtonPressed,
          ),
          SizedBox(height: DeviceConfig.screenHeight! * 0.01),
        ],
      ),
    );
  }
}
