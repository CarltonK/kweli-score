class StatementModel {
  String uid;
  String statementUrl;
  DateTime statementUploadedAt;
  DateTime expiresIn;

  StatementModel(this.uid, this.statementUrl)
      : this.statementUploadedAt = DateTime.now();

  Map<String, dynamic> toFirestore() => {
        'userId': uid,
        'statementUrl': statementUrl,
        'statementUploadedAt': statementUploadedAt
      };
}
