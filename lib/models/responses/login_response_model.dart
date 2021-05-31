import 'dart:convert';

import 'package:kweliscore/models/models.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.expiry,
    this.token,
    this.user,
  });

  DateTime? expiry;
  String? token;
  UserModel? user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        expiry: DateTime.parse(json["expiry"]),
        token: json["token"],
        user: UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "expiry": expiry!.toIso8601String(),
        "token": token,
        "user": user!.toJson(),
      };
}
