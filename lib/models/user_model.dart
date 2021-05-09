class UserModel {
  String emailAddress;
  String password;
  String phoneNumber;
  String nationalIdNumber;
  String userId;
  String deviceToken;
  String fullName;

  UserModel({
    this.emailAddress,
    this.password,
    this.phoneNumber,
    this.nationalIdNumber,
    this.deviceToken,
    this.fullName,
  });

  Map<String, dynamic> toFirestore() => {
        'emailAddress': emailAddress,
        'uid': userId,
        'phoneNumber': phoneNumber,
        'nationalIdNumber': nationalIdNumber,
        'deviceToken': deviceToken,
        'fullName': fullName,
      };
}
