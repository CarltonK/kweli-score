import 'dart:convert';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

// ignore: constant_identifier_names
enum Dashboard { Stale, NoReport, Swara, Chui, Simba }

class ApiProvider with ChangeNotifier {
  final Map<String, String> header = {"Content-type": "application/json"};

  Status _status = Status.Uninitialized;
  Status get status => _status;
  set status(Status newStatus) {
    _status = newStatus;
    notifyListeners();
  }

  Dashboard _dash = Dashboard.Simba;
  Dashboard get dash => _dash;
  set dash(Dashboard newDashboard) {
    _dash = newDashboard;
    notifyListeners();
  }

  late String _token;
  String get token => _token;
  set token(String newToken) {
    _token = newToken;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool newLoading) {
    _isLoading = newLoading;
    notifyListeners();
  }

  /// METHOD = POST
  ///
  /// PARAMS = id_number (String), password (String)
  Future loginRequest(UserModel user) async {
    _status = Status.Authenticating;
    notifyListeners();

    // Url
    String url = BASE_URL + '/score_sawa/';

    // Payload
    var body = jsonEncode(user.toLoginJson());

    // Request
    var loginRequest = await http.post(
      Uri.parse(url),
      body: body,
      headers: header,
    );
    // Response
    dynamic loginResponse = loginRequest.body;

    if (loginRequest.statusCode == 200) {
      _status = Status.Authenticated;
      notifyListeners();

      LoginResponse resp = loginResponseFromJson(loginResponse);
      await FirebaseCrashlytics.instance.setUserIdentifier(resp.user!.name!);

      return resp;
    } else {
      _status = Status.Unauthenticated;
      notifyListeners();

      return serverResponseFromJson(loginResponse);
    }
  }

  /// METHOD = POST
  ///
  /// PARAMS = UserModel
  Future verifyDetailsBeforeRegistration(UserModel user) async {
    // Url
    String url = BASE_URL + '/pre_reg/';

    // Payload
    var body = jsonEncode(user.toRegistrationJson());

    // Request
    var verifyRequest = await http.post(
      Uri.parse(url),
      body: body,
      headers: header,
    );
    // Response
    // dynamic verifyResponse = verifyRequest.body;

    if (verifyRequest.statusCode == 200) {
      // Save data locally
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', body);
    }

    return verifyRequest;
  }

  /// METHOD = POST
  ///
  /// PARAMS = UserModel
  Future otpRegistration(UserModel user) async {
    // Url
    String url = BASE_URL + '/validate_otp_register/';

    // Payload
    var body = jsonEncode(user.toFinalRegistrationJson());

    // Request
    var verifyRequest = await http.post(
      Uri.parse(url),
      body: body,
      headers: header,
    );
    // Response
    if (verifyRequest.statusCode == 201) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    }

    return verifyRequest;
  }

  /// METHOD = POST
  ///
  /// PARAMS = UserModel
  Future startPinReset(UserModel user) async {
    // Url
    String url = BASE_URL + '/start_to_reset_pin_view/';

    // Payload
    var body = jsonEncode(user.toinitialPinResetJson());

    // Request
    var verifyRequest = await http.post(
      Uri.parse(url),
      body: body,
      headers: header,
    );

    return verifyRequest;
  }

  /// METHOD = POST
  ///
  /// PARAMS = UserModel
  Future finallyPinReset(UserModel user) async {
    // Url
    String url = BASE_URL + '/forgot_pin_reset_view/';

    // Payload
    var body = jsonEncode(user.toFinalPinResetJson());

    // Request
    var verifyRequest = await http.post(
      Uri.parse(url),
      body: body,
      headers: header,
    );

    return verifyRequest;
  }

  /// METHOD = GET
  ///
  /// PARAMS = Token
  Future getDashboard(String token) async {
    // Url
    String url = BASE_URL + '/ukombele/';

    // Request
    var dashboardRequest = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Token $token', ...header},
    );
    // Response
    dynamic dashboardResponse = dashboardRequest.body;

    dynamic dashboardResponseJson = json.decode(dashboardResponse);

    if (dashboardRequest.statusCode == 200) {
      // Select dashboard to show
      if (dashboardResponseJson['detail'] == 'stale') {
        _dash = Dashboard.Stale;
        notifyListeners();

        return serverResponseFromJson(dashboardResponse);
      } else if (dashboardResponseJson['detail'] == 'no report') {
        _dash = Dashboard.NoReport;
        notifyListeners();

        return serverResponseFromJson(dashboardResponse);
      } else {
        String currentPlan = dashboardResponseJson['detail']['Current Plan'];
        if (currentPlan == 'Swara') {
          _dash = Dashboard.Swara;
          notifyListeners();
        } else if (currentPlan == 'Chui') {
          _dash = Dashboard.Chui;
          notifyListeners();
        } else if (currentPlan == 'Simba') {
          _dash = Dashboard.Simba;
          notifyListeners();
        }

        return dashboardResponseFromJson(dashboardResponse);
      }
    } else {
      return serverResponseFromJson(dashboardResponse);
    }
  }

  /// METHOD = GET
  ///
  /// PARAMS = Token
  Future getUser(String token) async {
    // Url
    String url = BASE_URL + '/user_profile/';

    // Request
    var profileRequest = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Token $token', ...header},
    );
    // Response
    dynamic profileResponse = profileRequest.body;

    if (profileRequest.statusCode != 200) {
      return serverResponseFromJson(profileResponse);
    } else {
      return userModelFromJson(profileResponse);
    }
  }

  /// METHOD = PATCH
  ///
  /// PARAMS = Token
  Future patchUser(UserModel user, String token) async {
    // Load
    _isLoading = true;
    notifyListeners();

    // Url
    String url = BASE_URL + '/user_profile/';

    // Payload
    var body = jsonEncode(user.toProfileEditJson());

    // Request
    var profileRequest = await http.patch(
      Uri.parse(url),
      headers: {'Authorization': 'Token $token', ...header},
      body: body,
    );

    // Stop loading
    _isLoading = false;
    notifyListeners();
    // Response
    dynamic profileEditResponse = profileRequest.body;

    return serverResponseFromJson(profileEditResponse);
  }
}
