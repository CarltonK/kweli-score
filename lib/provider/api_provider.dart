import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/utilities/utilities.dart';

// ignore: constant_identifier_names
enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class ApiProvider with ChangeNotifier {
  final Map<String, String> header = {"Content-type": "application/json"};

  Status _status = Status.Uninitialized;
  Status get status => _status;
  set status(Status newStatus) {
    _status = newStatus;
    notifyListeners();
  }

  String? _token;
  String get token => _token!;
  set token(String newToken) {
    _token = newToken;
    notifyListeners();
  }

  /// METHOD = POST
  ///
  /// PARAMS = id_number (String), password (String)
  Future loginRequest(String identity, String pin) async {
    _status = Status.Authenticating;
    notifyListeners();

    // Url
    String url = BASE_URL + '/score_sawa/';

    // Payload
    var body = jsonEncode({'id_number': identity, 'password': pin});

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

      return loginResponseFromJson(loginResponse);
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
    var body = jsonEncode(user);

    // Request
    var verifyRequest = await http.post(
      Uri.parse(url),
      body: body,
      headers: header,
    );
    // Response
    dynamic verifyResponse = verifyRequest.body;

    return serverResponseFromJson(verifyResponse);
  }

  /// METHOD = POST
  ///
  /// PARAMS = UserModel
  Future otpRegistration(UserModel user) async {
    // Url
    String url = BASE_URL + '/validate_otp_register/';

    // Payload
    var body = jsonEncode(user);

    // Request
    var verifyRequest = await http.post(
      Uri.parse(url),
      body: body,
      headers: header,
    );
    // Response
    dynamic verifyResponse = verifyRequest.body;

    return serverResponseFromJson(verifyResponse);
  }

  /// METHOD = POST
  ///
  /// PARAMS = id_number
  Future startPinReset(String idNumber) async {
    // Url
    String url = BASE_URL + '/start_to_reset_pin_view/';

    // Payload
    var body = jsonEncode({'id_number': idNumber});

    // Request
    var verifyRequest = await http.post(
      Uri.parse(url),
      body: body,
      headers: header,
    );
    // Response
    dynamic verifyResponse = verifyRequest.body;

    return serverResponseFromJson(verifyResponse);
  }

  /// METHOD = POST
  ///
  /// PARAMS = UserModel
  Future finallyPinReset(UserModel user) async {
    // Url
    String url = BASE_URL + '/start_to_reset_pin_view/';

    // Payload
    var body = jsonEncode(user);

    // Request
    var verifyRequest = await http.post(
      Uri.parse(url),
      body: body,
      headers: header,
    );
    // Response
    dynamic verifyResponse = verifyRequest.body;

    return serverResponseFromJson(verifyResponse);
  }

  /// METHOD = GET
  ///
  /// PARAMS = Token
  Future getDashboard(String token) async {
    // Url
    String url = BASE_URL + '/start_to_reset_pin_view/';

    // Request
    var dashboardRequest = await http.post(
      Uri.parse(url),
      headers: {'Authorization': 'Token $token', ...header},
    );
    // Response
    dynamic dashboardResponse = dashboardRequest.body;

    if (dashboardRequest.statusCode == 200) {
    } else {
      return serverResponseFromJson(dashboardResponse);
    }
  }
}
