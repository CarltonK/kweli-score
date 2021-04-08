class UserModel {
  String email;
  String password;
  String phoneNumber;
  String idNumber;
  String uid;
  String token;

  UserModel({
    this.email,
    this.password,
    this.phoneNumber,
    this.idNumber,
    this.token,
  });

  Map<String, dynamic> toFirestore() => {
        'email': email,
        'uid': uid,
        'phoneNumber': phoneNumber,
        'idNumber': idNumber,
        'token' : token,
      };
}
