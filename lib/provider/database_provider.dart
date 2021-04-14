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
      user.deviceToken = await fcm.getToken();
      await _db.collection("users").doc(uid).set(user.toFirestore());
    } catch (e) {
      print("saveUser ERROR -> ${e.toString()}");
    }
  }

  //Save document uploads to DB

}
