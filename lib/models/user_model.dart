import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.password,
    this.name,
    this.phone,
    this.password1,
    this.password2,
    this.email,
    this.email2,
    this.dob,
    this.gender,
    this.idNumber,
    this.otp,
    this.pin,
    this.pinConfirm,
  });

  String? password;
  String? name;
  String? phone;
  String? password1;
  String? password2;
  String? email;
  String? email2;
  String? dob;
  String? gender;
  String? idNumber;
  String? otp;
  String? pin;
  String? pinConfirm;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        password: json["password"] ?? '',
        name: json["name"] ?? '',
        phone: json["phone"],
        password1: json["password1"] ?? '',
        password2: json["password2"] ?? '',
        email: json["email"] ?? '',
        dob: json["dob"] ?? '',
        email2: json["email2"] ?? '',
        gender: json["gender"] ?? '',
        idNumber: json["id_number"] ?? '',
        otp: json["otp"] ?? '',
        pin: json["pin"] ?? '',
        pinConfirm: json["pin_confirm"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "name": name,
        "phone": phone,
        "password1": password1,
        "password2": password2,
        "email": email,
        "email2": email2,
        "dob": dob,
        "gender": gender,
        "id_number": idNumber,
        "otp": otp,
        "pin": pin,
        "pin_confirm": pinConfirm,
      };

  Map<String, dynamic> toRegistrationJson() => {
        "name": name,
        "phone": phone,
        "password1": password1,
        "password2": password2,
        "email": email,
        "email2": email2,
        "dob": dob,
        "gender": gender,
        "id_number": idNumber,
      };

  Map<String, dynamic> toFinalRegistrationJson() => {
        "name": name,
        "phone": phone,
        "password1": password1,
        "password2": password2,
        "email": email,
        "email2": email2,
        "dob": dob,
        "gender": gender,
        "id_number": idNumber,
        "otp": otp,
      };

  Map<String, dynamic> toLoginJson() => {
        'id_number': idNumber,
        'password': password,
      };

  Map<String, dynamic> toinitialPinResetJson() => {
        'id_number': idNumber,
      };
}
