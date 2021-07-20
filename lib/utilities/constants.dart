import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kweliscore/utilities/utilities.dart';

class Constants {
  // Constructor
  Constants.empty();

  /*
  TEXT STYLES
  */
  static const TextStyle boldHeadlineStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );

  static const TextStyle whiteBoldSubheadlineStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle blackBoldNormal = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle boldSubheadlineStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle kHeadlineStyle = TextStyle(
    fontSize: 30,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle kHeadlineWhiteStyle = TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle kHeadlineBlackStyle = TextStyle(
    fontSize: 20,
    color: Colors.black,
  );

  static const TextStyle kNegativeButtonStyle = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle kPositiveButtonStyle = TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  /*
  BORDERS
  */
  static const InputBorder blackInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  );

  /*
  SIZING
  */
  static const double padding = 20;
  static const double avatarRadius = 45;

  /*
  DECORATIONS AND BORDERS
  */

  static BoxDecoration kAvatarDecoration = BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(width: 4, color: Palette.ksmartPrimary),
  );

  static const BoxDecoration kBoxDecoration = BoxDecoration(
    color: Colors.greenAccent,
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );

  static InputDecoration otpInputDecoration = InputDecoration(
    contentPadding:
        EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
    border: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
  );

  static OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: Palette.kTextColor),
    gapPadding: 10,
  );

  static RoundedRectangleBorder curvedRectBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  /*
  THEME
  */
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    platform: TargetPlatform.iOS,
    fontFamily: 'Lato',
    appBarTheme: appBarTheme,
    inputDecorationTheme: inputDecorationTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static AppBarTheme appBarTheme = AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: GoogleFonts.latoTextTheme(),
  );

  static TextTheme textTheme = GoogleFonts.latoTextTheme();

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );

  /*
  REGEX
  */
  static RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  /*
  FORM ERRORS
  */
  static const String kIdNumberNullError =
      'Please enter your Identification Number';
  static const String kInvalidEmailError = 'Please enter a valid Email';
  static const String kPassNullError = 'Please enter your password';
  static const String kShortPassError = 'Password is too short';
  static const String kMatchPassError = 'Passwords don\'t match';
  static const String kNamelNullError = 'Please enter your name';
  static const String kPhoneNumberNullError = 'Please enter your Phone Number';
  static const String kAddressNullError = "Please enter your address";

  /*
  Duration
  */
  static const Duration veryFluidDuration = Duration(milliseconds: 200);
  static const Duration fluidDuration = Duration(milliseconds: 500);

  /*
  Curves
  */
  static Curve verySmoothCurve = Curves.easeOutCubic;

  /*
  DropDown List
  */
  static const List<String> maritalStatus = [
    'Single',
    'Married',
    'Divorced',
    'Widowed',
    'Separated'
  ];

  static const List<String> occupationStatus = [
    'Business',
    'Student',
    'Employed',
    'Civil Servant',
    'Retired',
    'Unemployed'
  ];

  static const List<String> grossIncomeOptions = [
    '1 - 25,000',
    '25,001 - 50,000',
    '50,001 - 100,000',
    '100,001 - 150,000',
    '150,001 - 250,000',
    '> 250,000'
  ];

  static const List<String> genderOptions = [
    'Male',
    'Female',
    'Other',
  ];
  static const List<String> pensionOptions = [
    'No pension',
    'NSSF only',
    'Employer pension',
    'Personal pension plan(PPP)',
    'Employer pension + PPP',
  ];

  static const List<String> houseOwnershipOptions = [
    'Rented',
    'Fully owned',
    'Mortgage/TPS',
    'Company Provided',
    'Living with others',
  ];
}
