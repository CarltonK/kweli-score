import 'package:flutter/material.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProfileEditForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  ProfileEditForm({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  _ProfileEditFormState createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {
  final _profileEditFormKey = GlobalKey<FormState>();

  UserModel? user;

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
  final _focusPhoneNumber3 = FocusNode();
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

  TextFormField buildPhoneNumber2Field() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue!.trim(),
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
        FocusScope.of(context).requestFocus(_focusPhoneNumber3);
      },
      decoration: InputDecoration(
        labelText: 'Home Number',
        hintText: 'Enter your home number',
        helperText: 'This must be an Mpesa registered number',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GlobalIcon(svgIcon: "assets/icons/phone.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumber3Field() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      focusNode: _focusPhoneNumber3,
      onSaved: (newValue) => phoneNumber = newValue!.trim(),
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
        labelText: 'Alternate Number',
        helperText: 'This must be an Mpesa registered number',
        hintText: 'Enter an alternate number',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GlobalIcon(svgIcon: "assets/icons/phone.svg"),
      ),
    );
  }

  DropdownButtonFormField buildDropDownField(
      List<DropdownMenuItem<String>> item,
      String value,
      Function(dynamic)? onChanged) {
    return DropdownButtonFormField(
      items: item,
      value: value,
      onChanged: onChanged,
    );
  }

  navigateToOtpPage() {
    Navigator.of(context).push(
      SlideLeftTransition(
        page: OtpScreen(),
        routeName: 'otp_screen',
      ),
    );
  }

  _registrationHandler(UserModel model) async {
    return await context
        .read<ApiProvider>()
        .verifyDetailsBeforeRegistration(model);
  }

  registrationButtonPressed() {
    final FormState _formState = _profileEditFormKey.currentState!;
    if (_formState.validate()) {
      _formState.save();

      KeyboardUtil.hideKeyboard(context);

      user = UserModel();

      // Connect the backend
      _registrationHandler() {}
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
      key: _profileEditFormKey,
      child: Column(
        children: [
          buildPhoneNumber2Field(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumber3Field(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDropDownField(
              Constants.maritalStatus
                  .map((e) => DropdownMenuItem<String>(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              '',
              null),
          SizedBox(height: getProportionateScreenHeight(30)),
          SizedBox(height: getProportionateScreenHeight(30)),
          SizedBox(height: getProportionateScreenHeight(30)),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          GlobalActionButton(
            action: 'Submit',
            onPressed: registrationButtonPressed,
          ),
          SizedBox(height: DeviceConfig.screenHeight! * 0.01),
        ],
      ),
    );
  }
}
