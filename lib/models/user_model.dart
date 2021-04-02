class UserModel {
  String email;
  String password;
  String phoneNumber;
  String idNumber;
  String uid;

  UserModel({
    this.email,
    this.password,
    this.phoneNumber,
    this.idNumber,
  });

  Map<String, dynamic> toFirestoreDoc() => {
        'email': email,
        'uid': uid,
        'phoneNumber': phoneNumber,
        'idNumber': idNumber,
      };
}
