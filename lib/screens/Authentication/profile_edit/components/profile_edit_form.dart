import 'package:flutter/material.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/models/models.dart';
// import 'package:kweliscore/provider/providers.dart';
// import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';
// import 'package:provider/provider.dart';

class ProfileEditForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  ProfileEditForm({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  _ProfileEditFormState createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {
  final _profileEditFormKey = GlobalKey<FormState>();

  UserModel? user;

  String? phoneNumber2,
      phoneNumber3,
      currentMaritalStatus,
      currentPensionStatus,
      currentGender,
      currentOccupationStatus,
      currentRentAmount,
      currentDependants,
      currentGrossIncomeBracket,
      currentCounty,
      currentHouseOwnershipStatus,
      currentDob;

  bool isRented = false;

  final List<String> errors = [];

  final int _eighteenYearsInDays = 6570;
  final int _hundredYearsInDays = 36500;

  final _focusPhoneNumber3 = FocusNode();
  final _focusDob = FocusNode();

  TextEditingController? _dobController;
  DatePrettier? _dateConverter;

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
      onSaved: (newValue) => phoneNumber2 = newValue!.trim(),
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
      onSaved: (newValue) => phoneNumber3 = newValue!.trim(),
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
        FocusScope.of(context).requestFocus(_focusDob);
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

  _pickDate() async {
    final DateTime now = DateTime.now();

    DateTime? _dob = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: now.subtract(
        Duration(days: _eighteenYearsInDays + 1),
      ),
      firstDate: now.subtract(
        Duration(days: _hundredYearsInDays),
      ),
      lastDate: now.subtract(
        Duration(days: _eighteenYearsInDays),
      ),
    );

    if (_dob != null) {
      _dateConverter = DatePrettier(_dob);
      setState(() {
        currentDob = _dateConverter!.convertToymd();
        _dobController!.text = currentDob!;
      });
    }
  }

  buildDobField() {
    return InkWell(
      onTap: _pickDate,
      child: IgnorePointer(
        child: TextFormField(
          focusNode: _focusDob,
          controller: _dobController,
          onFieldSubmitted: (value) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            labelText: 'Date of Birth',
            helperText: 'You must be over 18 years old',
            hintText: 'Please enter your date of birth',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: GlobalIcon(svgIcon: "assets/icons/calendar.svg"),
          ),
        ),
      ),
    );
  }

  buildMaritalStatusField() {
    return GlobalDropdownWidget(
      items: Constants.maritalStatus
          .map((e) => DropdownMenuItem<String>(child: Text(e), value: e))
          .toList(),
      value: currentMaritalStatus,
      onChanged: (newValue) => setState(() => currentMaritalStatus = newValue),
      label: 'Marital Status',
    );
  }

  buildPensionStatusField() {
    return GlobalDropdownWidget(
      items: Constants.pensionOptions
          .map((e) => DropdownMenuItem<String>(child: Text(e), value: e))
          .toList(),
      value: currentPensionStatus,
      onChanged: (newValue) => setState(() => currentPensionStatus = newValue),
      label: 'Pension Status',
    );
  }

  buildGenderField() {
    return GlobalDropdownWidget(
      items: Constants.genderOptions
          .map((e) => DropdownMenuItem<String>(child: Text(e), value: e))
          .toList(),
      value: currentGender,
      onChanged: (newValue) => setState(() => currentGender = newValue),
      label: 'Gender',
    );
  }

  buildOccupationStatusField() {
    return GlobalDropdownWidget(
      items: Constants.occupationStatus
          .map((e) => DropdownMenuItem<String>(child: Text(e), value: e))
          .toList(),
      value: currentOccupationStatus,
      onChanged: (newValue) =>
          setState(() => currentOccupationStatus = newValue),
      label: 'Occupation Status',
    );
  }

  buildHouseOwnershipStatusField() {
    return GlobalDropdownWidget(
      items: Constants.houseOwnershipOptions
          .map((e) => DropdownMenuItem<String>(child: Text(e), value: e))
          .toList(),
      value: currentHouseOwnershipStatus,
      onChanged: (newValue) {
        setState(() => currentHouseOwnershipStatus = newValue);
        if (newValue == 'Rented') {
          setState(() => isRented = true);
        } else {
          setState(() => isRented = false);
        }
      },
      label: 'House Ownership Status',
    );
  }

  buildRentAmountField() {
    return AnimatedSwitcher(
      duration: Constants.fluidDuration,
      switchInCurve: Curves.easeInCubic,
      switchOutCurve: Curves.easeInCubic,
      child: isRented
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  onSaved: (newValue) => currentRentAmount = newValue!.trim(),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: Constants.kRentAmountNullError);
                    }
                    return null;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      addError(error: Constants.kRentAmountNullError);
                      return "";
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    labelText: 'Rent Amount',
                    hintText: 'How much do you pay in rent?',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: GlobalIcon(svgIcon: "assets/icons/cash.svg"),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
              ],
            )
          : Container(),
    );
  }

  buildGrossIncomeField() {
    return GlobalDropdownWidget(
      items: Constants.grossIncomeOptions
          .map((e) => DropdownMenuItem<String>(child: Text(e), value: e))
          .toList(),
      value: currentGrossIncomeBracket,
      onChanged: (newValue) =>
          setState(() => currentGrossIncomeBracket = newValue),
      label: 'Gross Income',
    );
  }

  buildCountyOptionsField() {
    return GlobalDropdownWidget(
      items: Constants.kenyanCounties
          .map((e) => DropdownMenuItem<String>(child: Text(e), value: e))
          .toList(),
      value: currentCounty,
      onChanged: (newValue) => setState(() => currentCounty = newValue),
      label: 'County',
    );
  }

  buildDependantOptionsField() {
    return GlobalDropdownWidget(
      items: Constants.dependantOptions
          .map((e) => DropdownMenuItem<String>(child: Text(e), value: e))
          .toList(),
      value: currentDependants,
      onChanged: (newValue) => setState(() => currentDependants = newValue),
      label: 'Dependants',
    );
  }

  _profileEditHandler(UserModel model) async {}

  registrationButtonPressed() {
    final FormState _formState = _profileEditFormKey.currentState!;
    if (_formState.validate()) {
      _formState.save();

      KeyboardUtil.hideKeyboard(context);

      user = UserModel();

      // Connect the backend
      _profileEditHandler(user!);
    }
  }

  @override
  void initState() {
    super.initState();

    _dobController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _dobController!.dispose();

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
          buildDobField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildGenderField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildMaritalStatusField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDependantOptionsField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPensionStatusField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildOccupationStatusField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildHouseOwnershipStatusField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildRentAmountField(),
          buildGrossIncomeField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCountyOptionsField(),
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
