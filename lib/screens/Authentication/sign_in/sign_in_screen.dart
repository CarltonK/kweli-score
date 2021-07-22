import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<ScaffoldState> _scaffoldLoginKey = GlobalKey<ScaffoldState>();

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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

  @override
  void initState() {
    super.initState();

    checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldLoginKey,
      appBar: AppBar(
        title: Text(
          'Sign In',
          style: Constants.boldSubheadlineStyle,
        ),
      ),
      body: SignInBody(scaffoldKey: _scaffoldLoginKey),
    );
  }
}
