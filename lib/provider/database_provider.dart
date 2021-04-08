import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kweliscore/models/user_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class DatabaseProvider {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseMessaging fcm = FirebaseMessaging();

  Future saveUser(UserModel user, String uid) async {
    user.uid = uid;
    try {
      user.token = await fcm.getToken();
      await _db.collection("users").doc(uid).set(user.toFirestore());
    } catch (e) {
      print("saveUser ERROR -> ${e.toString()}");
    }
  }
}
