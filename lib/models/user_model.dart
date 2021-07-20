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
    this.principalPhone,
    this.genderProfile,
    this.emailProfile,
    this.age,
    this.currentPlan,
    this.phone2,
    this.phone3,
    this.maritalStatus,
    this.pensionStatus,
    this.occupationStatus,
    this.hseOwnStatus,
    this.rentAmt,
    this.dependants,
    this.grossIncome,
    this.county,
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

  String? principalPhone;
  String? genderProfile;
  String? emailProfile;
  String? age;
  String? currentPlan;
  dynamic phone2;
  dynamic phone3;
  String? maritalStatus;
  String? pensionStatus;
  String? occupationStatus;
  String? hseOwnStatus;
  dynamic rentAmt;
  int? dependants;
  String? grossIncome;
  String? county;

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
        principalPhone:
            json["Principal Phone"] == null ? null : json["Principal Phone"],
        genderProfile: json["Gender"] == null ? null : json["Gender"],
        emailProfile: json["Email"] == null ? null : json["Email"],
        age: json["Age"] == null ? null : json["Age"],
        currentPlan: json["Current Plan"] == null ? null : json["Current Plan"],
        phone2: json["phone_2"],
        phone3: json["phone_3"],
        maritalStatus:
            json["marital_status"] == null ? null : json["marital_status"],
        pensionStatus:
            json["pension_status"] == null ? null : json["pension_status"],
        occupationStatus: json["occupation_status"] == null
            ? null
            : json["occupation_status"],
        hseOwnStatus:
            json["hse_own_status"] == null ? null : json["hse_own_status"],
        rentAmt: json["rent_amt"],
        dependants: json["dependants"] == null ? null : json["dependants"],
        grossIncome: json["gross_income"] == null ? null : json["gross_income"],
        county: json["county"] == null ? null : json["county"],
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
        "Principal Phone": principalPhone == null ? null : principalPhone,
        "Gender": genderProfile == null ? null : genderProfile,
        "Email": emailProfile == null ? null : emailProfile,
        "Age": age == null ? null : age,
        "Current Plan": currentPlan == null ? null : currentPlan,
        "phone_2": phone2,
        "phone_3": phone3,
        "marital_status": maritalStatus == null ? null : maritalStatus,
        "pension_status": pensionStatus == null ? null : pensionStatus,
        "occupation_status": occupationStatus == null ? null : occupationStatus,
        "hse_own_status": hseOwnStatus == null ? null : hseOwnStatus,
        "rent_amt": rentAmt,
        "dependants": dependants == null ? null : dependants,
        "gross_income": grossIncome == null ? null : grossIncome,
        "county": county == null ? null : county,
      };

  Map<String, dynamic> toRegistrationJson() => {
        "name": name,
        "email": email,
        "id_number": idNumber,
        "phone": phone,
        "password1": password1,
        "password2": password2,
      };

  Map<String, dynamic> toFinalRegistrationJson() => {
        "name": name,
        "email": email,
        "id_number": idNumber,
        "phone": phone,
        "password1": password1,
        "password2": password2,
        "otp": otp,
      };

  Map<String, dynamic> toLoginJson() => {
        'id_number': idNumber,
        'password': password,
      };

  Map<String, dynamic> toinitialPinResetJson() => {
        'id_number': idNumber,
      };

  Map<String, dynamic> tointermidiatePinResetJson() => {
        'id_number': idNumber,
        'otp': otp,
      };

  Map<String, dynamic> toFinalPinResetJson() => {
        'id_number': idNumber,
        'otp': otp,
        'pin': pin,
        'pin_confirm': pinConfirm,
      };

  Map<String, dynamic> toProfileEditJson() => {
        "phone_2": phone2,
        "phone_3": phone3,
        "marital_status": maritalStatus == null ? null : maritalStatus,
        "pension_status": pensionStatus == null ? null : pensionStatus,
        "occupation_status": occupationStatus == null ? null : occupationStatus,
        "hse_own_status": hseOwnStatus == null ? null : hseOwnStatus,
        "rent_amt": rentAmt,
        "dependants": dependants == null ? null : dependants,
        "gross_income": grossIncome == null ? null : grossIncome,
        "county": county == null ? null : county,
      };
}
