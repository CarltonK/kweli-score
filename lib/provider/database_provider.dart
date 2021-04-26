import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kweliscore/models/models.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class DatabaseProvider {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseMessaging fcm = FirebaseMessaging();

  Future saveUser(UserModel user, String uid) async {
    user.userId = uid;
    try {
      // Register device to receive notifications
      user.deviceToken = await fcm.getToken();

      // User document reference
      DocumentReference userDoc = _db.collection('users').doc(uid);

      // Save document
      await userDoc.set(user.toFirestore());
    } on FirebaseException {
      rethrow;
    }
  }

  Future saveStatement(String uid, String statementFile) async {
    try {
      // Statement document reference
      DocumentReference statementDoc = _db.collection('statements').doc();

      StatementModel _statement = StatementModel(uid, statementFile);

      // Save statement
      await statementDoc.set(_statement.toFirestore());
    } on FirebaseException {
      rethrow;
    }
  }
}
