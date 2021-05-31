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

  String _token;
  String get token => _token;
  set token(String newToken) {
    _token = newToken;
    notifyListeners();
  }

  /*
   * POST
   * Params = UserModel
   */
  Future loginRequest(UserModel user) async {
    _status = Status.Authenticating;
    notifyListeners();

    // Url
    String url = BASE_URL + '/score_sawa/';

    // Payload
    var body = jsonEncode(user);

    // Request
    var loginRequest = await http.post(
      url,
      body: body,
      headers: header,
    );
    // Response
    dynamic loginResponse = loginRequest.body;

    if (loginRequest.statusCode == 200) {
      return loginResponseFromJson(loginResponse);
    } else {
      return serverResponseFromJson(loginResponse);
    }
  }
}
