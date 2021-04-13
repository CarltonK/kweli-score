class UserModel {
  String emailAddress;
  String password;
  String phoneNumber;
  String nationalIdNumber;
  String userId;
  String deviceToken;

  UserModel({
    this.emailAddress,
    this.password,
    this.phoneNumber,
    this.nationalIdNumber,
    this.deviceToken,
  });

  Map<String, dynamic> toFirestore() => {
        'emailAddress': emailAddress,
        'uid': userId,
        'phoneNumber': phoneNumber,
        'nationalIdNumber': nationalIdNumber,
        'deviceToken': deviceToken,
      };
}
